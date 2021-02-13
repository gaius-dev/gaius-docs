---
layout: default
title: Gaius Static Site Generation Platform
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator
description: Gaius Documentation Homepage
...

Gaius is an ultra-fast static site generation platform that was inspired by [Jekyll](https://jekyllrb.com/) and various blogging platforms that leveraged Jekyll (e.g. [Octopress](http://octopress.org/)).

The Gaius platform consists of the following components:

1. [Gaius engine](https://github.com/gaius-dev/gaius-engine/tree/main/src){.badge .badge-primary} : Responsible for taking source input data and transforming it to HTML.
1. [Gaius server](https://github.com/gaius-dev/gaius-engine/tree/main/src/GaiusServer){.badge .badge-primary} : A Kestrel based micro-server for testing generated sites locally.
1. [Gaius CLI wrapper](https://github.com/gaius-dev/gaius-engine/tree/main/cli){.badge .badge-primary} : Provides a convient way to interact with the Gaius engine and server, and to download updates to the Gaius platform.
1. [Gaius Github Actions](https://github.com/gaius-dev/gaius-engine/tree/main/github-actions){.badge .badge-primary} : Provides a workflow which will automatically generate and deploy your site to Github Pages.
1. [Gaius starter site](https://github.com/gaius-dev/gaius-starter){.badge .badge-primary} : Provides an opinionated starter site and template (Bootstrap based) that you can use to build your own sites.

## Gaius Engine

The beating heart of the Gaius platform is the engine.  The engine is responsible for taking source input data and transforming it to HTML.

The main goals for the Gaius engine are:

1. **Performance**: site generation should be fast and efficient.
1. **Visualization**: the user should be able to see exactly what changes will be made to the generated site content when processing the source input files.
1. **Extensibility**: currently we only support a single worker (i.e. "Markdown Liquid Worker"), but the engine itself supports "pluggable" workers which can process different types of source input files.

The Gaius engine is written 100% in C# (.NET Core), and as such requires the .NET Core Runtime in order to run the site generation process locally.

{.d-block}
^^^
![Gaius engine in action]({{site.url}}/images/engine.png){.rounded .mx-auto .d-block}
^^^ Gaius engine in action{.text-center}

## Gaius Server

The Gaius Server is a [Kestrel](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel) based micro-server that can be used to test out your generated site locally.  By default it runs on `http://localhost:5000`.

{.d-block}
^^^
![Gaius server running]({{site.url}}/images/gaius-server.png){.img-thumbnail .d-block .mx-auto}
^^^ Gaius server running to test generated site locally{.text-center}

## Gaius CLI Wrapper

The Gaius CLI consists of a shell script *(for Linux/OSX/Windows GitBash)* and a PowerShell script *(for Windows PowerShell)*.  It provides a simple wrapper around the Gaius engine itself, and most importantly provides an easy mechanism to update the Gaius engine, the Gaius server, the Github Actions workflows, and the CLI itself.

## Gaius Github Actions

A Gaius Github Actions workflow has been provided to make it extremely easy to deploy your site using Github Pages.  Simply maintain your source input files in the `main` branch, and the Github Actions workflow will automatically use the Gaius engine to process your source input files, and push the output to the `gh-pages` branch.  You can also view workflow runs directly in the Github interface, allowing you to easily troubleshoot any site generation issues.

:::{.alert .alert-warning}
**Github default branch change**
___
Github has recently switched from `master` being the default branch name for new repositories, to `main`.  As such our Github Actions workflow has been updated to reflect this.  In order for the Gaius Github Actions workflow to function, you must have your default branch set as `main` and maintain all of your source input data in the `main` branch.
:::

## Gaius Starter Site

The Gaius Starter Site provides a template (based on Bootstrap) and some starter source input files that you can use as a launching-off point to create your own sites.

## Eating our Own Dog Food!

We use the Gaius platform to manage *this* site (the Gaius Documentation site).  This provides us with an excellent way to test and ehnance the platform and ensure that it continues to work smoothly.

## Getting Started

Please consult our comprehensive [Getting Started Guide]({{site.url}}/guides/getting-started.html){.badge .badge-primary} to start building a new site using Gaius!

## Acknowledgements

The Gaius platform would not be possible without some incredible open-source projects.  The Gaius engine leverages the following libraries:

:::{.row}
{.col-md-2 .text-center}
![Markdig logo]({{site.url}}/images/markdig-logo.png){style="height:90px"}

{.col}
[Markdig](https://github.com/lunet-io/markdig/) is an incredible open-source markdown processing engine for .NET.  It also provides numerous extensions that can enhance the capabilities of the source markdown data.
:::

:::{.row}
{.col-md-2 .text-center}
![Fluid logo]({{site.url}}/images/fluid-logo.png){style="height:90px"}

{.col}
[Fulid](https://github.com/sebastienros/fluid) is an open-source .NET template engine that is as close as possible to the Liquid template language.
:::

:::{.row .pt-3} 
{.col-md-2 .text-center}
##### YamlDotNet

{.col}
[YamlDotNet](https://github.com/aaubry/YamlDotNet) is an excellent .NET based library for processing YAML.
:::
