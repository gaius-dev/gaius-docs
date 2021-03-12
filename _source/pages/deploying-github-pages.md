---
draft: true
layout: default-sidebar
title: Deploying to Github Pages
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started, Deploying to Github Pages
description: Gaius Getting Started Guide Deploying to Github Pages
sidebar_order: 2
...

#### Creating a new Github Repo

The Gaius platform has been designed specifically to work with Github Pages, so go ahead and create a new repository that will house your site.

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

:::{.text-center}
^^^
![Creating a new repository]({{site.url}}/images/guides/getting-started/new-repo.png){.img-fluid .img-thumbnail}
^^^ Creating a new repository
:::

#### Updating Remotes

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

#### Configure Gaius.json

The main configuration file for the Gaius engine is `gaius.json`.  Open it and look for the `GenerationRootPrefix` setting.  It should currently be set to `//gaius-dev.github.io/gaius-starter`.  You need to update this value to the URL that will be used to access your Github Pages site.  Here is an example `gaius.json` file that is used for my Github Pages user site [https://rstrube.github.io].

{.bg-light}
```json
{
    "Logging": {
        "LogLevel": {
            "Default": "Information",
            "Microsoft": "Warning",
            "Microsoft.Hosting.Lifetime": "Warning"
        }
    },
    "AllowedHosts": "*",
    "GaiusEngine": {
        "SourceDirectoryName": "_source",
        "GenerationDirectoryName": "_generated",
        "ThemesDirectoryName": "_themes",
        "PostsDirectoryName": "_posts",
        "DraftsDirectoryName": "_drafts",
        "PostUrlPrefix": "",
        "TagListDirectoryName": "_taglist",
        "TagUrlPrefix": "tag",
        "ThemeName": "default",
        "Pagination": 5,
        "GenerationUrlRootPrefix": "//rstrube.github.io",
        "AlwaysKeep": [
            ".git"
        ]
    }
}
```
:::{.alert .alert-warning}
**Protocol agnostic GenerationUrlRootPrefix**
___
It's recommened that you omit the protocol (e.g. `http://`, `https://`) and instead just use `//`.  This tells the browser to use whatever protocol is currently active.
:::

#### Initial Commit

Gaius behaves differently than some other static site generation platforms in that you don't actually need to commit the generated assets.  The Github Actions workflow that comes with Gaius will automatically trigger and generate your site assets whenever you commit source data to the `main` branch.  These generated assets will then be committed *automatically* to the `gh-pages` branch (assuming there is no error generating site).The `gh-pages` branch is used by default by Github Pages.

For now go ahead and make your initial commit:

{.bg-light}
```shell
$ git add .
$ git commit -m "Initial commit"
$ git push -u origin main
```
You should now see your initial commit appear in your `main` branch within your repository:

:::{.text-center}
^^^
![Initial commit]({{site.url}}/images/guides/getting-started/initial-commit.png){.img-fluid .img-thumbnail}
^^^ Initial commit
:::

In addition, if you click on **Actions** tab you should see that a workflow has already been kicked off which is generating your site from your source input data.  This workflow might have already completed by the time you examine the **Actions** tab.  If the workflow succeeded you should see something like:

:::{.text-center}
^^^
![Initial workflow run]({{site.url}}/images/guides/getting-started/initial-workflow-run.png){.img-fluid .img-thumbnail}
^^^ Initial workflow run{.text-center}
:::

You can always view workflow runs to troubleshoot generation errors.

#### Configure Repository for Github Pages

The final step is to configure your repository to support Github Pages.

To do this navigate to the **Settings -> Options-** tab for your repository.  Scroll down until you see the Github Pages configuration.  It's most likely configured to use the `main` branch by default.  Change this branch to `gh-pages`.  This will configure the Github Pages infrastructure to look in your `gh-pages` branch for your site resources (i.e. the generated HTML, images, etc.).

:::{.text-center}
^^^
![Github Pages configuration]({{site.url}}/images/guides/getting-started/gh-pages-config.png){.img-fluid .img-thumbnail}
^^^ Github Pages configuration
:::

#### Validate Site

You should now be able to navigate to: `https://<user>.github.io` to view your generated site (e.g. [https://rstrube.github.io]).  It should look something like:

:::{.text-center}
^^^
![Initial generated site]({{site.url}}/images/guides/getting-started/initial-generated-site.png){.img-fluid .img-thumbnail}
^^^ Initial generated site
:::
