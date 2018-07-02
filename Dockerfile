FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NODE_VERSION 8.11.3
ENV NODE_FULL_NAME node-v8.11.3-win-x64

#install node and npm as MS no longer does this in any .NET Core nanoserver based images since 2.1
RUN New-Item -ItemType directory -Path /build; \
    Invoke-WebRequest https://nodejs.org/dist/v${env:NODE_VERSION}/${env:NODE_FULL_NAME}.zip -OutFile /build/${env:NODE_FULL_NAME}.zip; \
    Expand-Archive -LiteralPath /build/${env:NODE_FULL_NAME}.zip /build; \
    $newPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path; \
    $nodeFullName = ${env:NODE_FULL_NAME}; \
    $newPath = $newPath + ';/build/' + $nodeFullName; \
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath;

# install angular cli as that is required for publish
RUN npm install -g @angular/cli@1.7.0

# copy csproj and restore as distinct layers so we break cache as little as possible
COPY ./test-web-app/*.csproj ./test-web-app-src/
WORKDIR /app/test-web-app-src
RUN dotnet restore

# copy everything else and build app
COPY ./test-web-app/. .
WORKDIR /app/test-web-app-src/ClientApp
RUN npm install
WORKDIR /app/test-web-app-src
RUN dotnet build
RUN dotnet publish -c Release -o /app/test-web-app-pub

FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
COPY --from=build /app/test-web-app-pub ./
ENTRYPOINT ["dotnet", "test-web-app.dll"]
