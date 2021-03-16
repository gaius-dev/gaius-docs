---
layout: default
title: Getting Started
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started
description: Gaius Getting Started Guide
sidebar_order: 1
...

The Gaius platform has been designed to get you up and running as quickly as possible.  That being said, Gaius is a platform that's geared more towards a technical audience.  If you're unfamiliar with **git** and working within a text editor / IDE you should probably look elsewhere.

:::{.alert .alert-warning}
**Technical Chops Required**
___
It's recommended that you have some experience and familarity with the following items before chosing Gaius:

1. Working on the command line.
1. **git**.
1. Text editors (e.g. **vim**, **emacs**, **Notepad++**) or an IDE (e.g. **Visual Studio Code**).
1. Markdown files.
:::

#### Software Prerequisites{.pt-3}

Gauis requires certain software to be installed on your local system:

###### .NET SDK / Runtimes{.pt-1}

Gaius is written in C# using .NET 5.0.  As such you'll need to install the proper **.NET SDK / Runtimes** on your local machine in order to build and test your site.  Please visit the [.NET 5.0 Download Page](https://dotnet.microsoft.com/download/dotnet/5.0) to download and install the .NET 5.0 SDK (latest version).

For more information on exactly what to install and how to validate your .NET installation visit our [.NET Installation Guide]({{site.url}}/pages/advanced-installation/dotnet-installation/) guide.

###### Git{.pt-1}

Git is required to bootstrap your new site from the [Gaius starter site](https://gaius-dev.github.io/gaius-starter).  It's also required if you wish to deploy your site to Github Pages.

##### Bootstraping Your New Site{.pt-3}

The [Gaius starter site](https://gaius-dev.github.io/gaius-starter) provides a *nearly* empty starter site that can be used as the basis for creating new sites.  It comes with a homepage (blog listing page), a single blog post, and the default Gaius theme.  It also comes with the latest version of the Gaius engine binaries.

It's *highly* recommended that new users leverage the Gaius starter site when creating a new Gaius-based site.

:::{.alert .alert-warning}
**Advanced Installation**
___
There might be some unique situations where you don't want to use the Gaius starter site as the basis for your new site.  Please consult the [Gaius Advanced Installation]({{site.url}}/pages/advanced-installation/) guide for more information.
:::

In order to bootstrap your new site, you'll clone the `gaius-starter` repository.  Before cloning, consider what you'll call your new repository.  If you plan to deploy the site as a user Github Pages site, you'll most likely want to name the new repo `{username}.github.io`.

* Open a terminal and navigate to a parent directly where you'll be cloning the repository (e.g. `~/Projects`, `C:\Projects`, etc.).
* Clone the `gaius-starter` repository (*It's recommended that when cloning you provide a new repo name.*).
* Navigate into the newly cloned repository directory.

For example: 

{.bg-light}
```shell
$ cd ~/Projects
$ git clone https://github.com/gaius-dev/gaius-starter <repo-name>
# e.g. git clone https://github.com/gaius-dev/gaius-starter rstrube.github.io
$ cd <repo-name>
# e.g. cd rstrube.github.io
```
Now confirm that you can run the Gaius engine.  If you've installed the .NET SDK correctly, you should be able to run the following command and see output similar to:

{.bg-light}
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

:::{.alert .alert-warning}
**Location of Gaius Engine Binaries**
___
The standard location for the Gaius engine binaries is `<repo-name>/bin/gaius`.  When you cloned the Gaius starter site, the Gaius engine binaries were automatically downloaded and deployed at this location.
:::

#### Building and Testing Your Site{.pt-3}

You can now build and test your site locally.  To do this run Gaius with the `serve` command:

:::{.alert .alert-warning}
**Wide Load**
___
Gaius displays *lots* of information in your terminal.  For best results please maximize the terminal window, otherwise the content displayed will wrap in a way that makes it more difficult to read.
:::

{.bg-light}
```shell
$ dotnet ./bin/gaius/gaius.dll serve
```
Gaius will now show a visualization of how the site *would* be built, and will ask you if you want to execute the build process:

{.bg-light}
```shell
[ Site Directory] /home/robert/Projects/gaius/gaius-starter
[ Src. Directory] /home/robert/Projects/gaius/gaius-starter/_source
[Theme Directory] /home/robert/Projects/gaius/gaius-starter/_themes/default
[ Gen. Directory] /home/robert/Projects/gaius/gaius-starter/_generated
[  Testmode On  ] True

[ .. ] gaius-starter                         [ ..... root   R ] 
[ .. ] |_ _source                            [ copy  create + ] |_ _generated
[ .. ]    |_ _drafts                         [ ..... skip   _ ]    |_ /yyyy/MM/dd/[title]/
[ .. ]    |_ _posts                          [ ..... skip   _ ]    |_ /yyyy/MM/dd/[title]/
[ .. ]       |_ 2021-01-01-hello-world.md    [ trans create + ]       |_ /2021/01/01/hello-world/ 
[ .. ]    |_ _taglist                        [ ..... skip   _ ]    |_ /tag/[tag]/
[ .. ]       |_ index.md                     [ trans create + ]       |_ /tag/hello-gaius-/ 
[ .. ]       |_ index.md                     [ trans create + ]       |_ /tag/hello-world-/ 
[ .. ]    |_ images                          [ copy  create + ]    |_ images
[ .. ]       |_ author.webp                  [ copy  create + ]       |_ author.webp
[ .. ]       |_ posts                        [ copy  create + ]       |_ posts
[ .. ]          |_ hello-world.webp          [ copy  create + ]          |_ hello-world.webp
[ .. ]    |_ pages                           [ copy  create + ]    |_ pages
[ .. ]       |_ authors                      [ copy  create + ]       |_ authors
[ .. ]          |_ firstname-lastname.md     [ trans create + ]          |_ /firstname-lastname/ 
[ .. ]    |_ index.md                        [ trans create + ]    |_ [root] 
[ .. ] |_ _themes/default                    [ copy  create + ] |_ _generated
[ .. ]    |_ _layouts                        [ ..... skip   _ ]    |_ _layouts
[ .. ]       |_ author.liquid                [ ..... skip   _ ]       |_ author.liquid
[ .. ]       |_ default.liquid               [ ..... skip   _ ]       |_ default.liquid
[ .. ]       |_ post.liquid                  [ ..... skip   _ ]       |_ post.liquid
[ .. ]       |_ postlist.liquid              [ ..... skip   _ ]       |_ postlist.liquid
[ .. ]       |_ taglist.liquid               [ ..... skip   _ ]       |_ taglist.liquid
[ .. ]       |_ _partials                    [ copy  create + ]       |_ _partials
[ .. ]          |_ _footer.liquid            [ ..... skip   _ ]          |_ _footer.liquid
[ .. ]          |_ _head.liquid              [ ..... skip   _ ]          |_ _head.liquid
[ .. ]          |_ _nav_header.liquid        [ ..... skip   _ ]          |_ _nav_header.liquid
[ .. ]          |_ _paging.liquid            [ ..... skip   _ ]          |_ _paging.liquid
[ .. ]          |_ _post-teaser.liquid       [ ..... skip   _ ]          |_ _post-teaser.liquid
[ .. ]          |_ _sidebar.liquid           [ ..... skip   _ ]          |_ _sidebar.liquid
[ .. ]          |_ _nav                      [ copy  create + ]          |_ _nav
[ .. ]             |_ _nav-item.liquid       [ ..... skip   _ ]             |_ _nav-item.liquid
[ .. ]          |_ _sidebar                  [ copy  create + ]          |_ _sidebar
[ .. ]             |_ _sidebar-item-2.liquid [ ..... skip   _ ]             |_ _sidebar-item-2.liquid
[ .. ]             |_ _sidebar-item.liquid   [ ..... skip   _ ]             |_ _sidebar-item.liquid
[ .. ]    |_ images                          [ copy  create + ]    |_ images
[ .. ]       |_ logo.png                     [ copy  create + ]       |_ logo.png
[ .. ]    |_ scripts                         [ copy  create + ]    |_ scripts
[ .. ]       |_ main.js                      [ copy  create + ]       |_ main-637514546776305205.js
[ .. ]    |_ styles                          [ copy  create + ]    |_ styles
[ .. ]       |_ main.css                     [ copy  create + ]       |_ main-637514546776305205.css

All of the proposed operations are considered safe.
Do you wish to continue? (y/n)
```
Enter `y` to build the site and launch the Gaius micro-server.  Your site will now be accessible via a web browser at `http://localhost:5000`.

:::{.alert .alert-warning}
**Skipping the Build Prompt**
___
If you don't want Gaius to prompt you, add the `--yes` switch after the `serve` command (e.g. `dotnet ./bin/gaius/gaius.dll serve --yes`).
:::
{.d-block}
^^^

![Gaius starter site running locally]({{site.url}}/images/pages/getting-started/gaius-starter-site.png){.d-block .img-thumbnail .mx-auto}
^^^ Gaius starter site running locally{.text-center}

The Gaius server will detect file system changes in the `_source` or `_themes/default` sub-directories.  When it detects changes, it will automatically rebuild your site.  While the server is running you'll see output similar to:

{.bg-light}
```shell
info: Gaius.Server.GaiusFileSystemWatcher[0]
      Starting file system watcher for all data in /home/robert/Projects/gaius/rstrube.github.io
info: Gaius.Server.BackgroundHostedService.BuildRequestQueueProcessorHostedService[0]
      Starting build request queue processor, listening for build requests
```
When you're ready to terminate the server, press `CTRL+C` and the server will gracefully stop and return you to your shell.
