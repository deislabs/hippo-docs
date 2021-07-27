---
title: Quickstart
description: Get started with Hippo in three easy steps.
type: docs
weight: 1
---

Get started with Hippo in three easy steps.

1. Install CLI tools
1. Boot Hippo
1. Deploy your first application

For this quickstart, you will run the components of Hippo, create a hello world
application, and then run it on Hippo.  This quickstart is broken into two
parts:

This guide will help you set up a cluster suitable for evaluation, development
and testing.

## Prerequisites

- [Node.js](https://nodejs.org/)
- [Git](https://git-scm.com/)
- [.NET 5](https://dot.net/)
- [Rust](https://www.rust-lang.org/)

If you are writing applications in Rust, make sure to have the `wasm32-wasi`
target available:

```console
$ rustup target add wasm32-wasi
```

## Step 1: Install CLI Tools

Our first step begins here by [installing the CLI tools](install-cli-tools.md).

## Step 2: Boot Hippo

There are many ways to boot and install Hippo. You may choose to get up and
running in a cloud environment, or locally on your laptop.

If you would like to test on your local machine, follow our guide for [running
locally](boot.md).

## Step 3: Deploy your First Application

Last but not least, [register a user and deploy your first
application](deploy-your-first-application.md).

## Next Steps

The beginner tutorial ends here. In the meantime, you might want to check out
some pointers on [where to go from here](whatsnext.md).
