---
title: Install CLI Tools
description: How to install the Hippo CLI tools.
type: docs
weight: 2
---

## Install Hippo CLI

The Hippo command-line interface (CLI) lets you interact with Hippo. Use the
CLI to create, configure, and manage applications.

Install the latest `hippo` CLI by going to the
[Release page](https://github.com/deislabs/hippo-cli/releases).

After fetching the latest release, you should move it somewhere on your $PATH:

```console
$ mv hippo /usr/local/bin/
```

Check your work by running `hippo --version`:

```console
$ hippo --version
hippo-cli 0.8.0
```

## Install yo-wasm

yo-wasm generates new projects to be used with Hippo.

First, install [Yeoman](http://yeoman.io/) using `npm`. Then install
`generator-wasm` using `npm`.

```console
$ npm install -g yo
$ npm install -g generator-wasm
```

Once that's done, proceed to [Step 2: Boot Hippo]({{< relref "boot.md" >}})
