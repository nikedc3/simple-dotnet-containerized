# Blazor Container Application

A containerized Blazor web application built using .NET 8.0 and running on Red Hat Universal Base Image (UBI) 8.

## Overview

This project demonstrates a production-ready containerized Blazor application using multi-stage builds for optimal container size and security. The application uses the official Red Hat UBI 8 .NET runtime image for the final deployment stage.

## Prerequisites

- .NET 8.0 SDK
- Podman or Docker
- Git

## Project Structure

```
├── README.md
├── Dockerfile
└── MyBlazorApp/
    ├── Pages/
    ├── Properties/
    ├── wwwroot/
    ├── Program.cs
    └── MyBlazorApp.csproj
```

## Quick Start

1. Clone the repository:
```bash
git clone <repository-url>
cd <repository-name>
```

2. Build the container using Podman:
```bash
podman build -t blazor-app .
```

3. Run the container:
```bash
podman run -p 8080:8080 blazor-app
```

4. Access the application:
   - Open your browser and navigate to `http://localhost:8080`

## Detailed Build Steps

### Local Development

1. Navigate to the project directory:
```bash
cd MyBlazorApp
```

2. Restore dependencies:
```bash
dotnet restore
```

3. Build the application:
```bash
dotnet build
```

4. Run the application locally:
```bash
dotnet run
```

### Container Build and Deployment

The project uses a multi-stage Dockerfile for optimal build and deployment:

1. From the root directory, build the container:
```bash
podman build -t blazor-app .
```

2. Run the container:
```bash
podman run -p 8080:8080 blazor-app
```

Additional container options:
```bash
# Run in detached mode
podman run -d -p 8080:8080 blazor-app

# Run with a custom name
podman run -d -p 8080:8080 --name my-blazor-app blazor-app

# Run with environment variables
podman run -d -p 8080:8080 -e ASPNETCORE_ENVIRONMENT=Production blazor-app
```

## Container Details

- Base Image: `registry.access.redhat.com/ubi8/dotnet-80-runtime`
- Exposed Port: 8080
- Multi-stage build process:
  1. Build stage using .NET SDK
  2. Runtime stage using UBI 8 runtime-only image

## Environment Variables

- `ASPNETCORE_URLS`: Set to `http://+:8080`
- `DOTNET_RUNNING_IN_CONTAINER`: Set to `true`

## Development Notes

- The application uses multi-stage builds to minimize the final image size
- Build dependencies are not included in the final runtime image
- The container runs as a non-root user for enhanced security
- Health checks can be implemented for container orchestration

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

[Add your license information here]

## Support

For support and questions, please [create an issue](insert-issue-tracker-link) in the repository.