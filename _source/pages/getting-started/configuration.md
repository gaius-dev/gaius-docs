---
layout: default
title: Gaius Configuration
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started, Gaius Configuration
description: Gaius Getting Started Guide Gaius Configuration
sidebar_order: 1.2
...

The primary configuration file is `gaius.json` which should be placed directly in the **Site Container Directory**.

Here is the default `gaius.json` file that comes with the [Gaius Starter Site](https://github.com/gaius-dev/gaius-starter/):

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
        "GenerationUrlRootPrefix": "/gaius-starter",
        "AlwaysKeep": [
            ".git"
        ]
    }
}
```
{.pt-3}
You can modify this file to affect the way the Gaius Engine will generate your site.  All configuration properties that affect the Gaius Engine appear underneath the `GaiusEngine` object. Below is list of all the configuration properties and how they affect the Gaius Engine:


{.table .table-striped .table-bordered .mt-4}
|Configuration Property|Description|Default Value|
|--|--|--|
|`SourceDirectoryName`|Directory name for the **Source Directory**|`_source`|
|`GenerationDirectoryName`|Directory name for the **Generation Directory**|`_generated`|
|`ThemesDirectoryName`|Directory name for the **Themes Directory**|`_themes`|
|`PostsDirectoryName`|Directory name for the **Posts Directory**|`_posts`|
|`DraftsDirectoryName`|Directory name for the **Draft Posts Directory**|`_drafts`|
|`PostUrlPrefix`|URL segment prefix for all posts.  Orginarily URLs to posts are: `{host}/YYYY/MM/DD/{name}/`. If you specifiy a value, URLs to posts would be: `{host}/{prefix}/YYYY/MM/DD/{name}/`|`""`|
|`TagListDirectoryName`|Directory name for the **Tag List Directory**|`_taglist`|
|`TagUrlPrefix`|URL segment prefix for all dynamic tag list pages.  URLs to posts are: `{host}/{prefix}/{tag name}/`. **Note: value cannot be `"" or null`**|`tag`|
|`ThemeName`|The theme that should be used|`default`|
|`Pagination`|How many items per listing page|`5`|
|`GenerationUrlRootPrefix`|A prefix that should be applied to all URLs. **Note: only applied when *not* building the site using Test-Mode**|`""`|
|`AlwaysKeep`|An array of directory / file names that should never be deleted from the **Generation Directory** when building your site|`[ ".git" ]`|

{.pt-3}
#### When Should I Use `GenerationUrlRootPrefix`?

By default [Github Pages](https://pages.github.com/) **Project Sites** to will appear under the URL `https://{github organization or user}.github.io/{project name}/`.  For example the Github Pages site for the Gaius Starter Site is `https://gaius-dev.github.io/gaius-starter/`.  This is because `gaius-starter` is a project underneath the `gaius-dev` Github organization.  

The primary Github Pages site for the `gaius-dev` organization would be `https://gaius-dev.github.io/` and would *not* require a `GenerationUrlRootPrefix` value.  It doesn't hurt to explicitly include it anyway.

So the rule is:
* If you are depolying to a Github Pages project site **you must include a `GenerationUrlRootPrefix` value**.
* If you are deploying to a primary user or organization site (e.g. `https://gaius-dev.github.io/` or `https://rstrube.github.io`) you can leave this value empty.

{.pt-3}
#### Why Keep `.git` in the Generation Directory?

In some advanced scenarios you might want to maintain a separate git repository in **Generation Directory** that is associated with a dedicated branch with your upstream remote.  Under most ordinary circumstances this isn't neccessary as the Github Actions Workflow will automatically handle bulding your site and commiting the generated site assets to the `gh-pages` branch.

The default value is here to help users that wish to implement more complex git workflows when building and pushing their generated site assets.
