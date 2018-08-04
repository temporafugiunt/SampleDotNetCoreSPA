# SampleDotNetCoreSPA
This is the sample App used by the [Docker Setup](https://github.com/temporafugiunt/DockerSetupInfo) repository in the BuildSetup/DotNETCoreWebApps setup instruction for setting up a Dockerized .NET Core 2.1 Web App from scratch.

## Project Setup from Scratch

If you wish to create a project and repository of your own when following the above instructions, you can use the below instructions to generate a sample application from scratch.

## Installing Required Tools
| Tool                               | URL                                              |
| ---------------------------------- | ------------------------------------------------ |
| Git for Windows                    | https://git-scm.com/download/win                 |
| Install Latest .NET Core 2.1 SDK   | https://www.microsoft.com/net/download/windows   |
| Install Latest LTS Version of Node | https://nodejs.org/en/                           |

# Creating and Running a New Project
```
#get lastest SPA templates
dotnet new --install Microsoft.DotNet.Web.Spa.ProjectTemplates::*
npm install -g @angular/cli
npm install -g typescript

#create a new project, default for target framework doesn't seem to be working when .NET Core 2.1 SDK is Installed
dotnet new angular -f netcoreapp2.1 -o test-web-app

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
# bootstrap 3 requires boostrap-sass to support scss, that is native in bootstrap 4 but that requires jquery and popper.js
npm install bootstrap@latest --save
npm install jquery@latest --save
npm install popper.js@latest --save

# Set angular command line to create scss files instead of css.
ng set defaults.styleExt scss
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
        "../node_modules/bootstrap/scss/bootstrap.scss"
      ]
```
3. All references in ts files to css files should be renames to scss files and all css files should be renamed to scss.

Keep in mind that navebars between bootstrap 3 and bootstrap 4 changed so the seed project's navbar will be broken.

# Upgrading to Angular 6
The angular CLI and angular core projects in the .NET Seed project as of this writing were 1.7 and 5.2, both should be updated to the latest version of Angular which is version 6.1.X as of this writing. All of the below commands should still be executed in the ClientApp directory.

```
#Upgrade the command line first.
npm install @angular/cli@latest --save-dev  

# Running this command will update the angular-cli.json file to angular.json and update several other files as well to newer settings. 
ng update @angular/cli
# This will update Core Angular components
ng update @angular/core
ng update @nguniversal/module-map-ngfactory-loader 
```
