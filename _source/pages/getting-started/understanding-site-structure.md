---
layout: default
title: Understanding the Gaius Site Structure
author: Robert Strube
keywords: Gaius, Documentation, Static Site Generator, Getting Started, Understanding the Gaius Site Structure
description: Gaius Getting Started Guide Understanding the Gaius Site Structure
sidebar_order: 1.1
...

Before starting to create new content, it will be helpful to review the Gaius site structure conventions.  They have been designed to be logical and easy to use.

Below is an overview of the default Gaius site structure:

```
\{site container}   # Site Container Directory: the root for your Gaius site

    \_generated     # Generation Directory: contains all generated site content
                    #   (should be included in .gitignore)

    \_source        # Source Directory: contains all of your source date
        index.md        # The homepage for your site
        \_drafts        # Contains draft posts (named YYYY-MM-DD-{name}.md)
        \_posts         # Contains posts (named YYYY-MM-DD-{name}.md)
        \_taglist       # Contains .md file used to drive dynamic tag listing pages
            index.md        # Dynamic tag list .md file
        \images         # Contains images referenced in your .md files
        \pages          # Contains other dedicated pages (.md files)

    \_themes            # Themes Directory: contains all available themes
        \{theme name}       # Named Theme Directory: contains resources for a given theme
            \_layouts           # Layouts Directory: contains liquid layouts
                \_partials          # Partials Directory: contains all liquid partials
            \images         # Contains theme images (e.g. images baked into theme)
            \scripts        # Contains custom JS files the theme
            \styles     # Contains custom CSS for the theme

    \.github                
        \gaius-process.yml  # Gaius Github Action Workflow

    \bin                # Gaius Engine binaries

    \.gitignore         # Ignores _generated folder

    \gaius.json         # Gaius configuration file

```

:::{.alert .alert-warning}
**Alternative Gaius Site Structure**
___
It is possible to customize the directory names used by the Gaius Engine (for example change `_generated` to `_output` for the **Generation Directory**).  Although this is possible, it's not recommended unless absolutely neccessary.  To make these adjuments modify your `gaius.json` file.
:::
