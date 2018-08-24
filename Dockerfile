#sdk image
FROM microsoft/dotnet:2.1-sdk as build-env
WORKDIR /generator

COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj


COPY . .

RUN dotnet test tests/tests.csproj

RUN dotnet publish api/api.csproj -o /publish



#runtime
FROM microsoft/dotnet:2.1-runtime
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT ["dotnet","api.dll"]
