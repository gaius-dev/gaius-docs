# Gaius CLI wrapper for Windows
# v0.0.6

$version = "0.0.6"

function Main() {

    if($args[0] -eq "version")
    {
        dotnet .\bin\gaius\gaius.dll version
        "Gaius CLI wrapper version $version"
        Exit
    }

    if($args[0] -eq "update-all") 
    {
        Update-Engine
        Update-CLI
        Update-Github-Actions
        Exit
    }

    if($args[0] -eq "update-engine") 
    {
        Update-Engine
        Exit
    }

    if($args[0] -eq "update-cli") 
    {
        Update-CLI
        Exit
    }
    
    if($args[0] -eq "update-github-actions") 
    {
        Update-Github-Actions
        Exit
    }

    if( -not ( Test-Path .\bin\gaius -PathType Container ) )
    {
        "No Gaius engine binaries detected in .\bin.\gaius ..."
        Update-Engine
    }

    dotnet .\bin\gaius\gaius.dll $args
}

function Update-Engine() {

    if( Test-Path .\bin\gaius -PathType Container )
    {
        "Deleting existing Gaius engine binaries in .\bin\gaius ..."
        Remove-Item .\bin\gaius -Recurse
    }

    New-Item -Path ".\bin" -Name "gaius" -ItemType "directory"

    "Downloading latest release of Gaius engine binaries..."
    Invoke-WebRequest -Uri https://github.com/gaius-dev/gaius-engine/releases/latest/download/gaius-engine-bin.zip -OutFile .\gaius-engine-bin.zip

    "Extracting latest release of Gaius engine binaries to .\bin\gaius ..."
    Expand-Archive -Path .\gaius-engine-bin.zip -DestinationPath .\bin\gaius
    Remove-Item .\gaius-engine-bin.zip
}

function Update-CLI() {

    "Downloading latest release of Gaius CLI wrapper..."
    Invoke-WebRequest -Uri https://github.com/gaius-dev/gaius-engine/releases/latest/download/gaius-cli.zip -OutFile .\gaius-cli.zip

    "Extracting latest release of Gauis CLI wrapper..."
    Expand-Archive -Path .\gaius-cli.zip -DestinationPath .\ -Force
    Remove-Item .\gaius-cli.zip
}

function Update-Github-Actions() {

    if( Test-Path .\bin\gaius -PathType Container )
    {
        "Deleting existing Gaius Github actions in .\.github\workflows..."
        Remove-Item .\.github\workflows -Recurse
    }

    New-Item -Path ".\.github" -Name "workflows" -ItemType "directory"

    "Downloading latest release of Gaius Github actions..."
    Invoke-WebRequest -Uri https://github.com/gaius-dev/gaius-engine/releases/latest/download/gaius-github-actions.zip -OutFile .\gaius-github-actions.zip

    "Extracting latest release of Gaius Github actions to .\.github\workflows ..."
    Expand-Archive -Path .\gaius-github-actions.zip -DestinationPath .\.github\workflows
    Remove-Item .\gaius-github-actions.zip
}

Main $args