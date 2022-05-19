---
title: Running Locally
description: Boot hippo-server on a laptop or PC
type: docs
weight: 3
---

Running Hippo on your machine requires three steps:

1. Install Spin
1. Boot Hippo

## Install Spin

Hippo deploys applications using Spin, a framework for building and running
event-driven microservice applications with WebAssembly components.

Download the [latest release](https://github.com/fermyon/spin/releases) of Spin.
Extract the Spin binary and move it to a directory that is in your $PATH.

```console
$ mv spin /usr/local/bin/
```

No further configuration is necessary.

## Boot Hippo

Hippo relies on a number of services: Bindle, Nomad, and Traefik.

Applications are bundled up as a _bindle_. Bindles are collected together in a
[bindle server](https://github.com/deislabs/bindle) that you can search. Hippo
uses `bindle` under the hood for storing and organizing applications.

Hippo deploys applications to Nomad, a simple and flexible scheduler and
orchestrator for managing applications across a number of nodes.

Traefik is used to route incoming network traffic from the public internet to
the correct application. It acts as an OSI Layer 7 load balancer, making
routing decisions based on detailed information of the incoming request.

To run the nomad-local-demo project, clone the project from GitHub:

```console
$ git clone https://github.com/fermyon/nomad-local-demo
Cloning into 'nomad-local-demo'...
remote: Enumerating objects: 187, done.
remote: Counting objects: 100% (109/109), done.
remote: Compressing objects: 100% (77/77), done.
remote: Total 187 (delta 48), reused 82 (delta 29), pack-reused 78
Receiving objects: 100% (187/187), 43.43 KiB | 694.00 KiB/s, done.
Resolving deltas: 100% (72/72), done.
```

Start consul, nomad, vault, traefik, bindle, and hippo by running

```console
$ cd nomad-local-demo
$ ./run_servers.sh
```

Once that's done, proceed to [Step 2: Deploy an Application]({{< relref
"deploy-your-first-application.md" >}})
