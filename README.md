# SampleDotNetCoreSPA
This is the sample App used in the instructions of [Docker Setup](https://github.com/temporafugiunt/DockerSetupInfo) in the BuildSetup/DocNETCoreWebApps setup instructions.

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
dotnet new –install Microsoft.AspNetCore.SpaTemplates::* 
#create a new project 
dotnet new angular 

#restore nuget packages and NPM packages 
dotnet restore 
npm install 

#set proper environment 
setx ASPNETCORE_ENVIRONMENT "Development"
```


