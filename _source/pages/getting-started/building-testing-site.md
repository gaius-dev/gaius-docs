---
layout: default
title: Building and Testing your Site
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started, Building and Testing your Site
description: Gaius Getting Started Guide Building and Testing your Site
sidebar_order: 1.3
...

The Gaius engine binary `gaius.dll` is typically deployed at the following location `./bin/gaius/gaius.dll` underneath your **Site Container Directory**.

To run Gaius commands make sure you're in the **Site Container Directory** and use the `dotnet` command.  To start with, try running Gaius *without* any commands (i.e. `dotnet ./bin/gaius/gaius.dll`), you should see something like:

{.text-center}
:::
^^^
![Running Gaius without a command]({{site.url}}/images/pages/getting-started/no-command.png){.img-fluid .rounded}
^^^ Running Gaius without a command
:::

The help output is displayed because you did not enter a recongnized command.  The help output provides you with an overview of all available commands and the additional options that can be passed in to Gaius.  You can also see the same output by explicitly running the `help` command (i.e. `dotnet ./bin/gaius/gaius.dll help`).

The table below descibes each of the Gaius engine's commands:

{.table .table-striped .table-bordered .mt-4}
|Command|Description|
|--|--|
|`help`|Shows the help output.|
|`version`|Shows the version of the Gaius engine.|
|`showconfig`|Displays the configuration for the **Site Container Directory**.|
|`build`|Builds the site resources in the **Generation Directory**.|
|`serve`|Builds the site resources in the **Generation Directory** and launch a web server so you can browser to and test your site locally.|

{.pt-3}
#### Passing in a Path Argument

The `showconfig`, `build` and `serve` commands can all accept a `<path>` argument.  If you do *not* explicitly pass in a path argument, the current working directory is inferred.

For example, if your current working directory is `/home/robert/Projects/MyGaiusSite`, all the following commands would perform the same action:

* `dotnet ./bin/gaius/gaius.dll build`
* `dotnet ./bin/gaius/gaius.dll build .`
* `dotnet ./bin/gaius/gaius.dll build ./`
* `dotnet ./bin/gaius/gaius.dll build ~/Projects/MyGaiusSite`
* `dotnet ./bin/gaius/gaius.dll build /home/robert/Projects/MyGaiusSite`

All of the above commands (in this example scenario) would build the site that is defined in the **Site Container Directory** (e.g. `/home/robert/Projects/MyGaiusSite`).  It's important to note that (with the exception of the first simplified example) the extra path arguments are redundant and unneccessary.

{.alert .alert-warning}
:::
**When Would you Pass in an Explicit Path Argument?**
___
Gaius supports *both* relative and absolute paths, but most of the time you'll be building the site in the current **Site Container Directory** so this wouldn't be neccessary. In some advanced scenarios you might decide to install Gaius in a system wide fashion (not just in the `./bin/gaius` directory of the current **Site Container Directory**).  In these situations having the ability to target *any* **Site Container Directory** might become useful.  Please see the [Advanced & Supplemental Information]({{site.url}}/pages/advanced-supplemental-info/) page for more details.
:::

{.pt-3}
#### Build Command

The `build` command processes all source data in the **Source Directory** (default `<site container dir>/_source`) and outputs all generated site content to the **Generation Directory** (default `<site container dir>/_generated`).  By default it will present a visual representation of how the site will be built, including all the operations that will take place.  You will also be prompted to confirm building your site.

{.text-center}
:::
^^^
![Display output from the Gaius build command]({{site.url}}/images/engine.png){.img-fluid .rounded}
^^^ Display output from the Gaius `build` command
:::

{.alert .alert-warning}
:::
**Skipping the Confirmation Prompt**
___
If you don't want Gaius to prompt you, add the `--yes` option after the `serve` command (e.g. `dotnet ./bin/gaius/gaius.dll serve --yes`).
:::

{.pt-3}
#### Serve Command

The `serve` command does everything that the build command does *and* starts a web server (accessible via `https://localhost:5000`) that can be used to view and validate your generated site.

In addition, Gaius will detect any changes inside the **Source Directory** (including sub-directories) or the **Named Theme Directory** (including subdirectories) and automatically rebuild your site.

{.text-center}
:::
^^^
![Gaius serve command running]({{site.url}}/images/server.png){.img-fluid .img-thumbnail}
^^^ Gaius `serve` command running
:::


