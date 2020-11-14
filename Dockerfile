FROM mcr.microsoft.com/dotnet/sdk:3.1 AS builder
ADD src src
RUN dotnet publish -o buildOutput/ChangesRarely src/ChangesRarely
RUN dotnet publish -o buildOutput/ChangesOften src/ChangesOften


FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /buildOutput
COPY --from=builder buildOutput/ChangesRarely /buildOutput
COPY --from=builder buildOutput/ChangesOften /ChangesOften
