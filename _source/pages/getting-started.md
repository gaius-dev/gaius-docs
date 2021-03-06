---
draft: true
layout: default-sidebar
title: Getting Started Guide
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started
description: Gaius Getting Started Guide
nav_order: 1.1
...

Getting started with Gaius is a snap!

1. Make sure you have prerequisites installed (git and the .NET Core Runtime/SDK).
1. Clone the Gaius starter site.
1. Create a new repo in Github for your site.
1. Change your default remote to point to your new Github repo.
1. Configure `gaius.json`
1. Make your initial commit.
1. Configure Github Pages for your repo.
1. Confirm site generation.

### 1. Prerequisites

Certain software prerequisites must be met in order to use Gaius on your local development environment:

1. **Git**: In order to work with Gaius you'll need to have git installed. For Linux users, you're smart enough to figure this out :) For Windows users, download and install the [Windows version of Git](https://git-scm.com/download/win).  Gaius is geared towards more technical users and as such will require some knowledge of git (nothing crazy we promise!).
1. **.NET Core Runtime/SDK**: If you would like to generate and test your site locally, you'll need to install the .NET Core runtime.  You can download the [.NET Core 3.1 Runtime/SDK from Microsoft](https://dotnet.microsoft.com/download/dotnet-core/3.1).  

:::{.alert .alert-warning}
**.NET Core Runtime/SDK Considerations**
___
Unless you're planning on building the Gaius engine itself (most users will not need to do this), you technically only require the .NET Core Runtime *not* the SDK.  If you already have the .NET Core SDK installed, that will work fine as well, as it comes with the .NET Core Runtime.
___
Gaius has been built against the .NET Core 3.1 SDK (3.1.108 to be precise).  Microsoft has recently released .NET 5.0 (the next version of .NET Core), but we have yet to update to that version.  As such please download the latest version of the .NET Core 3.1 Runtime for the time being.
:::

Once you've installed the .NET Core 3.1 Runtime/SDK you should double check that you have it available via the command line.  Open up a terminal and type: `dotnet --version`

:::{.alert .alert-warning}
**Important note regarding Windows users' shell choice**
___
For all of the command line steps outlined in this guide you can choose to use *either* **Git Bash**, or **Powershell**, but *not* the default Command Prompt.
:::

You should see something like:

```shell
$ dotnet --version
3.1.108
```
If you see the version number displayed, congratulations! You can use the Gaius engine locally to generate a site.

### 2. Cloning the Starter Site

Open a terminal and navigate to a directory where you'll be cloning the Gaius starter site repository into (e.g. `~/Projects` or `C:\Projects`).

Now clone the `gaius-starter` repository.  It's recommended that when cloning the repo you provide a new directory name.

```shell
$ git clone https://github.com/gaius-dev/gaius-starter <site-name>
# e.g. git clone https://github.com/gaius-dev/gaius-starter rstrube.github.io
```

This will clone the Gaius starter site, which includes the latest Gaius engine binaries, Gaius server, Github Actions, and CLI.

Now navigate into the newly created repo directory.

```shell
$ cd <site-name>
```
At this point it probably makes sense to do a sanity check that you have everything up and running OK.  Go ahead and enter either: `./gaius.sh version` (Linux/OSX/Windows Git Bash) or `.\gaius.ps1 version` (Windows Powershell).

:::{.alert .alert-warning}
**Note on guide examples**
___
moving forward this guide will always use `./gaius.sh` for it's examples.  If you are the Gaius PowerShell CLI, please substitute this command with `.\gaius.ps1`
:::

You should see something like:

```shell
              _           
   __ _  __ _(_)_   _ ___ 
  / _` |/ _` | | | | / __|
 | (_| | (_| | | |_| \__ \
  \__, |\__,_|_|\__,_|___/
  |___/                   

Gaius Engine 0.0.30
Gaius Server 0.0.30
Gaius CLI wrapper version 0.0.30
```

This displays the Gaius engine, Gaius server, and CLI versions.  They should always be the same (unless you're doing something very specialized like beta testing a component).

### 3. Creating a new Github Repo

The Gaius platform has been designed specifically to work with Github Pages, so go ahead and create a new repository that will house your site.

:::{.alert .alert-warning}
**Support for Github alternatives**
___
The Gaius engine, Gaius server, and the CLI are completely agnostic, and it would be quite simple to leverage them for other applications / uses.  We also hope to roll out support for Gitlab in the future as well!
:::

:::{.alert .alert-warning}
**Github default branch change**
___
Github has recently switched from `master` being the default branch name for new repositories, to `main`.  As such our Github Actions workflow has been updated to reflect this.  In order for the Gaius Github Actions workflow to function, you must have your default branch set as `main` and maintain all of your source input data in the `main` branch.
:::

:::{.alert .alert-warning}
**Github Pages user/org sites vs. project sites**
___
There are some key differences between the way you create a repository for a user/organization site vs. a project site. Please consult the official [Github Pages documentation](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/creating-a-github-pages-site) for more information.
___
This Guide will assume that you are creating a user site.

When creating a new user based site it's extremely important to name the repository `<user>.github.io` e.g. `rstrube.github.io`.
:::

{.d-block}
^^^
![Creating a new repository]({{site.url}}/images/guides/getting-started/new-repo.png){.img-thumbnail .mx-auto .d-block}
^^^ Creating a new repository{.text-center}

### 4. Updating Remotes

The cloned `gaius-starter` repo is still pointing to an `origin` that is associated with `https://github.com/gaius-dev/gaius-starter`.  In fact if you run `git remote -v` you'll see the following:

```shell
$ git remote -v 
origin  https://github.com/gaius-dev/gaius-starter (fetch)
origin  https://github.com/gaius-dev/gaius-starter (push)
```
You'll now need to delete the existing `origin` remote and replace it with a new `origin` remote that points to your new repository.

```shell
# Remove existing origin remote
$ git remote rm origin

# Confirm that you no longer have any remotes
$ git remote -v

# Add a new origin remote to your new repository (replace <user> with your username)
$ git remote add origin https://github.com/<user>/<user>.github.io.git
# e.g. git remote add origin https://github.com/rstrube/rstrube.github.io.git

# Confirm that you successfully added the new origin remote
$ git remote -v
```

### 5. Configure Gaius.json

The main configuration file for the Gaius engine is `gaius.json`.  Open it and look for the `GenerationRootPrefix` setting.  It should currently be set to `//gaius-dev.github.io/gaius-starter`.  You need to update this value to the URL that will be used to access your Github Pages site.  Here is an example `gaius.json` file that is used for my Github Pages user site [https://rstrube.github.io].

{.bg-light}
```json
{
    "Logging": {
        "LogLevel": {
            "Default": "Information",
            "Microsoft": "Warning",
            "Microsoft.Hosting.Lifetime": "Information"
        }
    },
    "AllowedHosts": "*",
    "GaiusEngine": {
        "SourceDirectoryName" : "_source",
        "GenerationDirectoryName" : "_generated",
        "ThemesDirectoryName" : "_themes",
        "PostsDirectoryName" : "_posts",
        "ThemeName" : "default",
        "GenerationUrlRootPrefix": "//rstrube.github.io",
        "AlwaysKeep" : [
            ".git"
        ],
        "Worker" : "Gaius.Core.Worker.MarkdownLiquid.MarkdownLiquidWorker"
    }
}
```
:::{.alert .alert-warning}
**Protocol agnostic GenerationUrlRootPrefix**
___
It's recommened that you omit the protocol (e.g. `http://`, `https://`) and instead just use `//`.  This tells the browser to use whatever protocol is currently active.
:::

### 6. Initial Commit

Gaius behaves differently than some other static site generation platforms in that you don't actually need to commit the generated assets.  The Github Actions workflow that comes with Gaius will automatically trigger and generate your site assets whenever you commit source data to the `main` branch.  These generated assets will then be committed *automatically* to the `gh-pages` branch (assuming there is no error generating site).The `gh-pages` branch is used by default by Github Pages.

For now go ahead and make your initial commit:

{.bg-light}
```shell
$ git add .
$ git commit -m "Initial commit"
$ git push -u origin main
```
You should now see your initial commit appear in your `main` branch within your repository:

{.d-block}
^^^
![Initial commit]({{site.url}}/images/guides/getting-started/initial-commit.png){.img-thumbnail .mx-auto .d-block}
^^^ Initial commit{.text-center}

In addition, if you click on **Actions** tab you should see that a workflow has already been kicked off which is generating your site from your source input data.  This workflow might have already completed by the time you examine the **Actions** tab.  If the workflow succeeded you should see something like:

{.d-block}
^^^
![Initial workflow run]({{site.url}}/images/guides/getting-started/initial-workflow-run.png){.img-thumbnail .mx-auto .d-block}
^^^ Initial workflow run{.text-center}

You can always view workflow runs to troubleshoot generation errors.

### 7. Configure Repository for Github Pages

The final step is to configure your repository to support Github Pages.

To do this navigate to the **Settings -> Options-** tab for your repository.  Scroll down until you see the Github Pages configuration.  It's most likely configured to use the `main` branch by default.  Change this branch to `gh-pages`.  This will configure the Github Pages infrastructure to look in your `gh-pages` branch for your site resources (i.e. the generated HTML, images, etc.).

{.d-block}
^^^
![Github Pages configuration]({{site.url}}/images/guides/getting-started/gh-pages-config.png){.img-thumbnail .mx-auto .d-block}
^^^ Github Pages configuration{.text-center}

### 8. Confirm Site Generation

You should now be able to navigate to: `https://<user>.github.io` to view your generated site (e.g. [https://rstrube.github.io]).  It should look something like:

{.d-block}
^^^
![Initial generated site]({{site.url}}/images/guides/getting-started/initial-generated-site.png){.img-thumbnail .mx-auto .d-block}
^^^ Initial generated site{.text-center}

Congratulations you're now ready to view our [Authoring Content Guide]({{site.url}}/guides/authoring-content.html){.badge .badge-primary} to learn more about creating new content for your site!
