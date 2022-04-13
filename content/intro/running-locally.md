---
title: Running Locally
description: Boot hippo-server on a laptop or PC
type: docs
weight: 3
---

Running Hippo on your machine requires three steps:

1. Install Spin
1. Boot Bindle
1. Boot hippo-server

## Install Spin

Hippo deploys applications using Spin, a framework for building and running
event-driven microservice applications with WebAssembly components.

Download the [latest release](https://github.com/fermyon/spin/releases) of Spin.
Extract the Spin binary and move it to a directory that is in your $PATH.

```console
$ mv spin /usr/local/bin/
```

No further configuration is necessary.

## Boot Bindle

Applications are bundled up as a _bindle_. Bindles are collected together in a
[bindle server](https://github.com/deislabs/bindle) that you can search. Hippo
uses `bindle` under the hood for storing and organizing applications.

First, set up a local installation of
[Bindle](https://github.com/deislabs/bindle). This is where Hippo will publish
revisions of your application.

1. Download the [latest release](https://github.com/deislabs/bindle/releases)
   of bindle. Extract the `bindle` and `bindle-server` binaries and move them
   to a directory on your $PATH.

```console
$ mv bindle bindle-server /usr/local/bin/
```

To start the server, simply run

```console
$ bindle-server --unauthenticated
```

If you would like to see the available options, use the `--help` command.

By default, `bindle-server` listens on port 8080. You can verify it is running
by issuing a request to Bindle:

```console
$ bindle --server http://localhost:8080/v1 search
=== Showing results 1 to 0 of 0 (limit: 50)
```

## Boot hippo-server

Next, we will compile hippo-server from source.

### Prerequisites

Install the following to compile hippo-server from source:

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/)
- [.NET 6](https://dotnet.microsoft.com/download/dotnet/6.0)

### Building

hippo-server is written in C# using the
[ASP.NET](https://dotnet.microsoft.com/en-us/apps/aspnet) framework. The
Web UI uses Angular as the front-end web framework and Bulma as the design
framework, which (along with some other packages) is managed via
[npm](https://www.npmjs.com/).

To build the project, run:

```console
$ git clone https://github.com/deislabs/hippo
$ cd hippo/src/Web
$ dotnet build
```

Then run hippo-server, pointing at your local Bindle instance:

```console
$ export BINDLE_URL=http://localhost:8080/v1
$ dotnet run
```

Once that's done, proceed to [Step 2: Deploy an Application]({{< relref
"deploy-your-first-application.md" >}})
