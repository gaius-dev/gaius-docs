---
layout: default
title: Gaius Documentation Homepage
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator
description: Gaius Documentation Homepage
...

# Gaius Platform Introduction

Gaius is an ultra-fast static site generator platform that was inspired by [Jekyll](https://jekyllrb.com/) and various blogging platforms that leveraged Jekyll (e.g. [Octopress](http://octopress.org/)).

The Gaius platform consists of four main components:
1. Gaius engine, which is responsible for taking source input data and transforming it to HTML.
1. Gaius CLI, which is responsible for updating the Gaius engine, Github Actions workflows, and the CLI itself.
1. Gaius Github Actions, which provide some workflows which will automatically generate and deploy your site to Github Pages.
1. Gaius starter site, which provides an opinionated starter site and template (Bootstrap based) that you can use to build your own sites.

## Gaius Engine

The beating heart of the Gaius platform is the engine.  The engine is responsible for taking source input data and transforming it to HTML.

The main goals for the Gaius engine are:

1. Performance: site generation should be fast and efficient.
1. Visualization: the user should be able to see exactly what changes will be made to the generated site content when processing the source input files.
1. Extensibility: currently we only support a single worker (i.e. "Markdown Liquid Worker"), but the engine itself supports "pluggable" workers which can process different types of source input files.

The Gaius engine is written 100% in C# (.NET Core), and as such requires the .NET Core Runtime in order to run the site generation process locally.

![Gaius Engine in Action]({{root}}/images/engine.png)

## Gaius CLI

The Gaius CLI consists of a shell script (for Linux/OSX/Windows GitBash) and a PowerShell script (for Windows PowerShell).  It provides a simple wrapper around the Gaius engine itself, and most importantly provides an easy mechanism to update the Gaius engine, the Github Actions workflows, and the CLI itself.

## Gaius Github Actions

A Gaius Github Actions workflow has been provided to make it extremely easy to deploy your site using Github Pages.  Simply maintain your source input files in the `main` branch, and the Github Actions workflow will automatically use the Gaius engine to process your source input files, and push the output to the `gh-pages` branch.  You can also view workflow runs directly in the Github interface, allowing you to easily troubleshoot any site generation issues.

**Important Note: Github has recently switched from `master` being the default branch name for new repositories, to `main`.  As such our Github Actions workflow has been updated to reflect this.  In order for the Gaius Github Actions workflow to function, you must have your default branch set as `main` and maintain all of your source input data in the `main` branch.**

## Gaius Starter Site

The Gaius Starter Site provides a template (based on Bootstrap) and some starter source input files that you can use as a launching-off point to create your own sites.

## Eating our Own Dog Food!

We use the Gaius platform to manage *this* site (the Gaius Documentation site).  This provides us with an excellent way to test and ehnance the platform and ensure that it continues to work smoothly.

## Getting Started

Please consult our comprehensive [Getting Started Guide]({{root}}/guides/getting-started.html) to start building a new site using Gaius!
