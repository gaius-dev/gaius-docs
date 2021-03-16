---
layout: default
title: Gaius Platform Documentation
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator
description: Gaius Static Site Generation Platform Documentation Home
nav_order: 1
nav_title: Gaius Documentation Home
...

Gaius is an ultra-fast static site generation platform that was inspired by [Jekyll](https://jekyllrb.com/).  The engine uses a combination of [Markdown](https://www.markdownguide.org/) files and [Liquid Templates](https://shopify.github.io/liquid/) to generate a static site which can be easily deployed to [Github Pages](https://pages.github.com/) or any other HTTP server.

The main features of the platform are:

1. **Performance**: site generation is *blazing* fast.
1. **Visualization**: users are able visualize how the engine will generate their site from source data, and be warned if there's any potential for data loss.
1. **Theme Support**: theme resources are stored indepedantly from site source data.  Mulitple themes can be installed alongside one another, and users can easily switch between themes when generating their sites.
1. **Convenience**: several quality of life features (auto generating tag listing pages, site navigation, etc.) are provided to make it as easy as possible to standup a new site.
1. **Markdown Extensions**: many different markdown extensions are supported, allowing for richer content creation.

The Gaius platform consists of the following components:

1. [Gaius Engine](https://github.com/gaius-dev/gaius-engine/tree/main/src/): A console application and micro-web server that is used to generate your site *and* test it locally.
1. [Gaius Github Actions Workflow](https://github.com/gaius-dev/gaius-engine/tree/main/github-actions/): Provides a [Github Actions](https://github.com/features/actions/) Workflow which automatically generates and deploys your site to Github Pages.
1. [Gaius Starter Site](https://github.com/gaius-dev/gaius-starter/): Provides a *nearly* empty starter site and template (Bootstrap based) that you can use as the basis for your own sites.
1. [Gaius Default Themes](https://github.com/gaius-dev/gaius-themes/): Provides default themes(s) for you to use or extend.

#### Gaius Engine{.pt-3}

The Gaius engine is used to both generate and test your site locally. It is written 100% in C# (.NET 5.0), and weights around **740KB** (not counting the .NET runtime components).

:::{.text-center}
^^^
![Gaius engine in action]({{site.url}}/images/engine.png){.img-fluid .rounded}
^^^ Gaius engine in action
:::

The engine also contains a [Kestrel](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel/) based micro-server that can be used to run and test your generated site locally.  By default it runs on `http://localhost:5000`.

:::{.text-center}
^^^
![Gaius engine running local HTTP server to test site]({{site.url}}/images/server.png){.img-fluid .img-thumbnail}
^^^ Gaius engine running local HTTP server to test site
:::

#### Gaius Github Actions{.pt-3}

Gaius provides a [Github Actions](https://github.com/features/actions/) workflow to make it extremely easy to deploy your site using [Github Pages](https://pages.github.com/).  Simply maintain your source input files in the `main` branch, and the Github Actions workflow will automatically use the Gaius engine to process your source input files, and push the output to the `gh-pages` branch.  You can also view workflow runs directly in the Github interface, allowing you to easily troubleshoot any site generation issues.

#### Gaius Starter Site{.pt-3}

The [Gaius starter site](https://gaius-dev.github.io/gaius-starter/) provides a *nearly* empty starter site that can be used as the basis for creating new sites.  It comes with a homepage (blog listing page), a single blog post, and the default Gaius theme.  The theme is built using [Bootstrap](https://getbootstrap.com/docs/4.6/getting-started/introduction/) and [Liquid Templates](https://shopify.github.io/liquid/).

There is also a more fleshed out [Gaius example site](https://gaius-dev.github.io/gaius-example/) which demonstrates the capabilities of the Gaius platform.

#### Eating our Own Dog Food!{.pt-3}

We use the Gaius platform to manage *this* site (the Gaius Documentation site).  This provides us with an excellent way to test and ehnance the platform and ensure that it continues to work smoothly.

#### Getting Started{.pt-3}

Please consult our [Getting Started]({{site.url}}/pages/getting-started/) guide to start building a new site using Gaius!
