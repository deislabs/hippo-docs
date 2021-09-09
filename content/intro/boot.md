---
title: Boot Hippo
description: Boot Hippo.
type: docs
weight: 3
---

In this section, we will focus on three steps:

1. Boot Bindle
1. Install WAGI
1. Boot Hippo

## Boot Bindle

First, set up a local installation of
[Bindle](https://github.com/deislabs/bindle). This is where Hippo will publish
revisions of your application.

1. Download the [latest release](https://github.com/deislabs/bindle/releases)
   of bindle. Extract the `bindle` and `bindle-server` binaries and move them
   to a directory on your $PATH.

```console
$ mv bindle bindle-server /usr/local/bin/
```

To start the compiled server, simply run `bindle-server`. If you would like to
see the available options, use the `--help` command.

By default, `bindle-server` listens on port 8080. You can verify it is running
by issuing a request to Bindle:

```console
$ bindle --server http://localhost:8080/v1 search
query = ""
strict = true
offset = 0
limit = 50
total = 0
more = false
yanked = false
invoices = []
```

## Install WAGI

Hippo deploys applications using handlers following a Common Gateway
Interface like approach called WebAssembly Gateway Interface (WAGI). 

An incoming client HTTP request  is sent to the handler, which lauches the application as a WebAssembly module and passes the HTTP request to it using the WAGI protocol. The output of
the application - usually in the form of HTML - is then returned by the WebAssembly module, again using WAGI protocol, and the handler
relays the output back to the client as an HTTP response.

There are two implementations of WAGI that can be used in Hippo:

### WAGI binary

The WAGI binary is the default implementation of WAGI used in Hippo, it is a stand-alone binary that can be run on any system. It needs to be installed on the system where the Hippo is running.

Download the [latest release](https://github.com/deislabs/wagi) of WAGI.
Extract the WAGI binary and move it to a directory that is in your $PATH.

```console
$ mv wagi /usr/local/bin/
```

No further configuration is necessary.

### WAGI-dotnet

Hippo also includes a built in implementation of WAGI called [WAGI-dotnet](https://github.com/deislabs/wagi-dotnet). This implenentation launches a handler as an HTTP listener with the Hippo server process. No additional installation is necessary but to use it the environment variable `HIPPO_JOB_SCHEDULER` must be set to `wagi-dotnet` in the environment where Hippo is running.

## Boot Hippo

This guide explains how to set up your environment for running Hippo from source.

Hippo is a .NET web application, built with the [Model-View-Controller](https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app/start-mvc?view=aspnetcore-5.0&tabs=visual-studio) (MVC) approach.

The front-end uses the Bootstrap design framework, which (along with some other packages) is managed via [npm](https://www.npmjs.com/) and [gulp](https://gulpjs.com/).

Clone the [repository on GitHub](https://github.com/deislabs/hippo).

### System Requirements

Install the following development tools:

- [.NET 5](https://dot.net/)
- [Node.js](https://nodejs.org/en/download/)
- [npm](https://www.npmjs.com/get-npm)
- [WAGI](https://github.com/deislabs/wagi)

### Building

To build the project, run:

```console
$ dotnet restore
$ cd Hippo
$ npm run build
```

Then run Hippo, pointing at your local Bindle instance:

```console
$ export BINDLE_URL=http://localhost:8080/v1
# If you want to use wagi-dotnet, set HIPPO_JOB_SCHEDULER variable
$ export HIPPO_JOB_SCHEDULER=wagi-dotnet
$ dotnet run
```

Open your web browser to <https://localhost:5001> and accept the self-signed
certificate to view the Hippo Web UI.

Once that's done, proceed to [Step 3: Deploy an
Application]({{< relref "deploy-your-first-application.md" >}})
