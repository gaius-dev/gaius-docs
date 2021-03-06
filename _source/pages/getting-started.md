---
layout: default
title: Getting Started
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started
description: Gaius Getting Started Guide
sidebar_order: 1
...

The Gaius platform has been designed to get you up and running as quickly as possible.  That being said, Gaius is a platform that's geared more towards a technical audience.  If you're unfamiliar with `git` and working within a text editor / IDE you should probably look elsewhere.

{.alert .alert-warning}
:::
**Technical Chops Required**
___
It's recommended that you have some experience and familarity with the following items before chosing Gaius:

1. Working on the command line.
1. `git`.
1. Text editors (e.g. `vim`, `emacs`, [Notepad++](https://notepad-plus-plus.org/)) or a light-weight IDE like [Visual Studio Code](https://code.visualstudio.com/).
1. Markdown files.
:::

{.pt-3}
#### Software Prerequisites

Gauis requires certain software to be installed on your local system:

{.pt-1}
##### .NET SDK / Runtimes

Gaius is written in C# using .NET 5.0.  As such you'll need to install the proper **.NET SDK / Runtimes** on your local machine in order to build and test your site.  Please visit the [.NET 5.0 Download Page](https://dotnet.microsoft.com/download/dotnet/5.0) to download and install the .NET 5.0 SDK (latest version).

For more information on exactly what to install and how to validate your .NET installation visit our [.NET Installation Guide]({{site.url}}/pages/advanced-supplemental-info/dotnet-installation/) guide.

{.pt-1}
##### Git

Git is required to bootstrap your new site from the [Gaius starter site](https://gaius-dev.github.io/gaius-starter).  It's also required if you wish to deploy your site to Github Pages.

{.pt-3}
#### Bootstraping Your New Site

The [Gaius starter site](https://gaius-dev.github.io/gaius-starter) provides a *nearly* empty starter site that can be used as the basis for creating new sites.  It comes with a homepage (blog listing page), a single blog post, and the default Gaius theme.  It also comes with the latest version of the Gaius engine binaries.

It's *highly* recommended that new users leverage the Gaius starter site when creating a new Gaius-based site.

{.alert .alert-warning}
:::
**Advanced Installation**
___
There might be some unique situations where you don't want to use the Gaius starter site as the basis for your new site.  Please consult our [Advanced & Supplemental Information]({{site.url}}/pages/advanced-supplemental-info/) page for more information.
:::

In order to bootstrap your new site, you'll clone the `gaius-starter` repository.  Before cloning, consider what you'll call your new repository.  If you plan to deploy the site as a user Github Pages site, you'll most likely want to name the new repo `{username}.github.io`.

* Open a terminal and navigate to a parent directly where you'll be cloning the repository (e.g. `~/Projects`, `C:\Projects`, etc.).
* Clone the `gaius-starter` repository (*It's recommended that when cloning you provide a new repo name.*).
* Navigate into the newly cloned repository directory.  This is also the **Site Container Directory**.

For example: 

```shell
$ cd ~/Projects
$ git clone https://github.com/gaius-dev/gaius-starter <repo-name>
# e.g. git clone https://github.com/gaius-dev/gaius-starter rstrube.github.io
$ cd <repo-name>
# e.g. cd rstrube.github.io
```
Now confirm that you can run the Gaius engine. To do this run the `version` command (i.e. `dotnet ./bin/gaius/gaius.dll`).  If you've installed the .NET SDK / Runtimes correctly, you should see output similar to:

```shell
$ dotnet ./bin/gaius/gaius.dll version

              _           
   __ _  __ _(_)_   _ ___ 
  / _` |/ _` | | | | / __|
 | (_| | (_| | | |_| \__ \
  \__, |\__,_|_|\__,_|___/
  |___/                   

Gaius Engine X.X.XXX
```

{.alert .alert-warning}
:::
**Location of Gaius Engine Binaries**
___
The standard location for the Gaius engine binaries is `<site container dir>/bin/gaius`.  When you cloned the Gaius starter site, the Gaius engine binaries were automatically downloaded and deployed at this location.
:::

{.pt-3}
#### Building and Testing Your Site

You can now build and test your site locally.  To do this use the `serve` command:

```shell
$ dotnet ./bin/gaius/gaius.dll serve
```

{.alert .alert-warning}
:::
**Wide Load**
___
Gaius displays *lots* of information in your terminal.  For best results please maximize the terminal window, otherwise the content displayed will wrap in a way that makes it more difficult to read.
:::

Gaius will now show a visualization of how the site *would* be built, and will ask you if you want to execute the build process:

{.text-center}
:::
![Running the Gaius serve command for the first time]({{site.url}}/images/pages/getting-started/serve-command.png){.img-fluid .img-thumbnail}
^^^ Running the Gaius `serve` command for the first time
:::

{.pt-3}
Enter `y` to build the site and launch the Gaius micro-server.  Your site will now be accessible via a web browser at `http://localhost:5000`.

{.alert .alert-warning}
:::
**Skipping the Confirmation Prompt**
___
If you don't want Gaius to prompt you, add the `--yes` option after the `serve` command (e.g. `dotnet ./bin/gaius/gaius.dll serve --yes`).
:::

{.text-center}
:::
![Gaius starter site running locally]({{site.url}}/images/pages/getting-started/gaius-starter-site.png){.img-fluid .img-thumbnail}
^^^ Gaius starter site running locally
:::

{.pt-3}
The Gaius server will detect file system changes in the `_source` or `_themes/default` sub-directories.  When it detects changes, it will automatically rebuild your site.  While the server is running you'll see output similar to:

```shell
info: Gaius.Server.GaiusFileSystemWatcher[0]
      Starting file system watcher for all data in /home/robert/Projects/gaius/rstrube.github.io
info: Gaius.Server.BackgroundHostedService.BuildRequestQueueProcessorHostedService[0]
      Starting build request queue processor, listening for build requests
```
When you're ready to terminate the server, press `CTRL+C` and the server will gracefully stop and return you to your shell.
