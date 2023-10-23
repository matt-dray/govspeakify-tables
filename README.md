
# govspeakify-tables

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![](https://img.shields.io/badge/Shiny-shinylive-blue?style=flat&labelColor=white&logo=RStudio&logoColor=blue)](https://matt-dray.github.io/govspeakify-tables/)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/posts/2023-10-08-govspeakify-tables/)
<!-- badges: end -->

A [demo R Shiny app](https://matt-dray.github.io/govspeakify-tables/) to convert a pasted table to [Govspeak Markdown](https://govspeak-preview.publishing.service.gov.uk/guide).

This is a proof-of-concept for [Shinylive](https://posit-dev.github.io/r-shinylive/), which means all the R code is executed within the user's browser without the need for a server. I wrote more about this in [a blog post](https://www.rostrum.blog/posts/2023-10-08-govspeakify-tables/).

<img src='govspeakify-tables.gif' alt="Gif of an app called 'Govspeakify Tables'. A table is pasted into a text box, then a checkbox is ticked to say that the table has row titles and the number 4 is written into a text box that asks for row numbers that contain totals. The 'convert to Govspeak' button is clicked and a special Markdown version of the pasted table is printed. A 'copy' button underneath it is clicked." width="75%">
