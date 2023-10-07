
# govspeakify-tables

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![](https://img.shields.io/badge/Shiny-shinylive-blue?style=flat&labelColor=white&logo=RStudio&logoColor=blue)](https://matt-dray.github.io/govspeakify-tables/)
<!-- badges: end -->

A demo R Shiny app to convert a pasted table to [Govspeak Markdown](https://govspeak-preview.publishing.service.gov.uk/guide) using [{wordup}](https://github.com/matt-dray/wordup). See a [related blogpost](https://www.rostrum.blog/posts/2023-06-21-wordup-tables/).

The app can be accessed here: https://matt-dray.github.io/govspeakify-tables/

The app may never be finished or polished. It's just a proof-of-concept for [Shinylive](https://posit-dev.github.io/r-shinylive/), which allows serverless Shiny apps to be run in the browser. This is as simple as running `shinylive::export("govspeakify-tables", "docs")` and serving the `docs/` folder via GitHub Pages.
