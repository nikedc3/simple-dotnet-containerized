# Build Stage
FROM registry.redhat.io/ubi8/dotnet-80:8.0-11 AS build
USER root
WORKDIR /src

# Copy csproj and restore dependencies
COPY ["./MyBlazorApp/MyBlazorApp.csproj", "./"]
RUN dotnet restore

# Copy the rest of the code
COPY MyBlazorApp .

# Publish the application
RUN dotnet publish -c Release -o /app/publish

# Runtime Stage
FROM registry.access.redhat.com/ubi8/dotnet-80-runtime:latest AS final
USER 1001
WORKDIR /app

# Copy the published app from build stage
COPY --from=build /app/publish .

# Expose port 8080
EXPOSE 8080

# Set environment variables
ENV ASPNETCORE_URLS=http://+:8080
ENV DOTNET_RUNNING_IN_CONTAINER=true

# Set the entry point
ENTRYPOINT ["dotnet", "MyBlazorApp.dll"]