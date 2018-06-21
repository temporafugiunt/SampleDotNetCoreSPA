# SampleDotNetCoreSPA
This is the sample App used by the [Docker Setup](https://github.com/temporafugiunt/DockerSetupInfo) repository in the BuildSetup/DotNETCoreWebApps setup instruction for setting up a Dockerized .NET Core 2.0 Web App from scratch.

## Project Setup from Scratch

If you wish to create a project and repository of your own when following the above instructions, you can use the below instructions to generate a sample application from scratch.

## Installing Required Tools
| Tool                               | URL                                              |
| ---------------------------------- | ------------------------------------------------ |
| Git for Windows                    | https://git-scm.com/download/win                 |
| Install Latest .NET Core SDK       | https://www.microsoft.com/net/download/windows   |
| Install Latest LTS Version of Node | https://nodejs.org/en/                           |

# Creating and Running a New Project
```
#get lastest SPA templates
dotnet new --install Microsoft.DotNet.Web.Spa.ProjectTemplates::*
npm install -g @angular/cli

#create a new project, default for target framework doesn't seem to be working when .NET Core 2.1 SDK is Installed
dotnet new angular -f netcoreapp2.0 -o test-web-app

#restore nuget packages and NPM packages
cd test-web-app

# run this rather than dotnet restore / npm install, npm install can be run but needs to be done in the ClientApp directory.
dotnet build

# Command Prompt: set Development environment for testing as default is Production and will not be served with a dotnet run command if not published.
set ASPNETCORE_ENVIRONMENT=Development

# Powershell/Bash: set Development environment for testing as default is Production and will not be served with a dotnet run command if not published.
setx ASPNETCORE_ENVIRONMENT "Development"

# run the server
dotnet run
```

You can now browse to http://localhost:5000 and see the default angular seed project.

# Adding SASS Support for Base Angular Project

At the time of this writing, the .NET Angular Seed template does not support automatic setup of SCSS rather than straight CSS. This is a supplement to the seed project setup to also support SCSS.

1. Run the following commands in the ClientApp directory of the new seed project:

```
# Set angular command line to create scss files instead of css.
ng set defaults.styleExt scss
# bootstrap 3 requires boostrap-sass to support scss, that is native in bootstrap 4
npm install bootstrap-sass --save-dev
```

2. In the .angular-cli.json file change the styles configuration from this:

```
      "styles": [
        "styles.css",
        "../node_modules/bootstrap/dist/css/bootstrap.min.css"
      ]
```
to
```
      "styles": [
        "styles.scss",
        "../node_modules/bootstrap-sass/assets/stylesheets/_bootstrap.scss"
      ]
```

