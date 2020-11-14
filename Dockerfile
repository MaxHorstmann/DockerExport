FROM mcr.microsoft.com/dotnet/sdk:3.1 AS builder
ADD src src
RUN dotnet publish src/ChangesRarely
RUN dotnet publish src/ChangesOften

FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /buildOutput
COPY --from=builder src/ChangesRarely  . 
COPY --from=builder src/ChangesOften  . 

