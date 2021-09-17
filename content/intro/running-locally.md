---
title: Running Locally
description: Boot Hippo on a laptop or PC
type: docs
weight: 2
---

Running Hippo on your machine requires three steps:

1. Install WAGI
1. Boot Bindle
1. Boot Hippo

## Install WAGI

Hippo deploys applications using handlers following a Common Gateway Interface
like approach called WebAssembly Gateway Interface (WAGI). 

An incoming client HTTP request  is sent to the handler, which launches the
application as a WebAssembly module and passes the HTTP request to it using the
WAGI protocol. The output of the application - usually in the form of HTML - is
then returned by the WebAssembly module, again using WAGI protocol, and the
handler relays the output back to the client as an HTTP response.

Download the [latest release](https://github.com/deislabs/wagi) of WAGI.
Extract the WAGI binary and move it to a directory that is in your $PATH.

```console
$ mv wagi /usr/local/bin/
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

## Boot Hippo

Next, we will compile Hippo from source.

### Prerequisites

Install the following to compile Hippo from source:

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/)
- [.NET 5](https://dot.net/)

### Building

Hippo is a .NET web application, built with the
[Model-View-Controller](https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app/start-mvc?view=aspnetcore-5.0&tabs=visual-studio)
(MVC) approach.

The front-end uses the Bootstrap design framework, which (along with some other
packages) is managed via [npm](https://www.npmjs.com/) and
[gulp](https://gulpjs.com/).

To build the project, run:

```console
$ git clone https://github.com/deislabs/hippo
$ cd hippo/Hippo
$ dotnet restore
$ npm run build
```

Then run Hippo, pointing at your local Bindle instance:

```console
$ export BINDLE_URL=http://localhost:8080/v1
$ dotnet run
```

Once that's done, proceed to [Step 2: Deploy an Application]({{< relref
"deploy-your-first-application.md" >}})
