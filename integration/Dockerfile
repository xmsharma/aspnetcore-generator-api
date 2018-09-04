#sdk image
FROM microsoft/dotnet:2.1-sdk as build-env
WORKDIR /integration
COPY integration.csproj .
RUN dotnet restore
COPY . .
ENTRYPOINT ["dotnet","test"]
