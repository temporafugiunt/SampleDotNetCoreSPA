# SampleDotNetCoreSPA
This is the sample App used in the instructions of [Docker Setup](https://github.com/temporafugiunt/DockerSetupInfo) in the BuildSetup/DotNETCoreWebApps setup instructions.

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

#create a new project, default for target framework doesn't seem to be working when .NET Core 2.1 SDK is Installed
dotnet new angular -f netcoreapp2.0 -o test-web-app

#restore nuget packages and NPM packages
cd test-web-app

# run this rather than dotnet restore / npm install, npm install can be run but needs to be done in the ClientApp directory.
dotnet build

#set proper environment 
set ASPNETCORE_ENVIRONMENT=Development

# run the server
dotnet run
```

You can now browse to http://localhost:5000 and see the default angular seed project.

