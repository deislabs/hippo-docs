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

Hippo deploys applications as HTTP handlers following the Common Gateway
Interface using a project called WAGI. An incoming HTTP request is sent to
Hippo, which redirects the request to WAGI. WAGI then launches the application
as a WebAssembly module, passing the HTTP request to the module. The output of
the application - usually in the form of HTML - is returned to WAGI, and WAGI
relays the output back to the browser as an HTTP response.

Download the [latest release](https://github.com/deislabs/wagi) of WAGI.
Extract the WAGI binary and move it to a directory that is in your $PATH.

```console
$ mv wagi /usr/local/bin/
```

No further configuration is necessary for WAGI.

## Boot Hippo

Download the [latest release](https://github.com/deislabs/hippo) of Hippo.
Extract the project and move it somewhere sensible.

```console
$ mv hippo /usr/local/hippo
```

Restore Hippo's dependencies with

```console
$ dotnet restore
$ cd Hippo
$ npm run build
```

Then run Hippo, pointing at your local Bindle instance:

```console
$ export BINDLE_URL=http://localhost:8080/v1
$ dotnet run
```

Open your web browser to <https://localhost:5001> and accept the self-signed
certificate to view the Hippo Web UI.

Once that's done, proceed to [Step 3: Deploy an
Application](deploy-your-first-application.md)
