FROM mcr.microsoft.com/dotnet/sdk:3.1 AS builder
ADD src src
RUN dotnet publish -o buildOutput/ChangesRarely src/ChangesRarely
RUN dotnet publish -o buildOutput/ChangesOften src/ChangesOften

FROM alpine
COPY --from=builder buildOutput/ChangesRarely /buildOutput/ChangesRarely
COPY --from=builder buildOutput/ChangesOften /buildOutput/ChangesOften
