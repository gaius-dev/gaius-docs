---
layout: default
title: .NET Installation
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Advanced Installation Guide, .NET Installation
description: .NET Installation Guide
sidebar_order: 2.1
...

Gaius requires the .NET SDK or specific .NET Runtimes to be installed.

For Windows, MacOS, and most common Linux distributions (Ubuntu, Fedora, etc.) please visit the [.NET 5.0 Download Page](https://dotnet.microsoft.com/download/dotnet/5.0/) to download and install the .NET 5.0 SDK / Runtimes.

The simplest approach is to install the full .NET 5.0 SDK, which includes the following runtimes:

* .NET Runtime 5.0.x **(required by Gaius)**
* ASP.NET Core Runtime 5.0.x **(required by Gaius)**
* .NET Desktop Runtime 5.0.x

It's also possible to install just the **.NET Runtime** and the **ASP.NET Core Runtime**.  This has a smaller installation footprint, but the installation is more piecemeal.

#### Arch Linux .NET Installation (Recommended Packages){.pt-3}

For Arch Linux users it is recommended to use the AUR .NET packages as these are kept more up to date.

Use an AUR helper (e.g. [Paru]() or [Yay]()) to install the required packages:

```shell
paru -Syu dotnet-host-bin dotnet-runtime-bin dotnet-sdk-bin dotnet-targeting-pack-bin aspnet-runtime-bin aspnet-targeting-pack-bin
```

#### Validating your .NET Installation{.pt-3}

Run some terminal commands to validate your .NET installation:

```shell
$ dotnet --version
5.0.xxx

$ dotnet --list-runtimes 
Microsoft.AspNetCore.App 5.0.x [/usr/share/dotnet/shared/Microsoft.AspNetCore.App]
Microsoft.NETCore.App 5.0.x [/usr/share/dotnet/shared/Microsoft.NETCore.App]

```
*Note: there might be additional runtimes listed if you installed the full .NET SDK.*


