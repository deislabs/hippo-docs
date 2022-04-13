---
title: FAQ
description: Answers to frequently asked questions about Hippo
type: docs
weight: 10
---

## What is Hippo?

Hippo takes a fresh spin on the PaaS ecosystem, taking advantage of the
technology WebAssembly brings to the space.

Hippo works like this: A WebAssembly package is bundled up as a _bindle_.
Bindles are collected together in a [bindle
server](https://github.com/deislabs/bindle) that you can search. Hippo uses
`bindle` under the hood for storing and organizing applications.

Using the `hippo` command line interface, you can upload new releases or
prepare a bindle for local development. In the future, you can use this CLI to
create applications, configure channels, gather logs, attach TLS certificates,
and other commands you'd expect to use with a PaaS.

Hippo provides a web interface for users to register new accounts, access their
applications, and create new environments for testing.

Hippo makes it easy to run WebAssembly applications and services at scale.

## Why did you build Hippo?

We built Hippo to help with two things.

First, we want to make it simple to run applications and services compiled to
WebAssembly. When we make it easy to deploy and test out our ideas, the
WebAssembly community learns how to best run WebAssembly applications in
production. We also make it easier for newcomers to get going. **Hippo is about
growing WebAssembly adoption.**

Second, we want to make it easier for teams to manage their application release
life cycle. Hippo introduces a concept called "Channels" that eases the process
of collaborating on new ideas by automatically deploying your releases based on
their version number. Want to test your idea in a staging environment? Create a
new "Staging" channel and watch Hippo deploy your development builds live.
**Hippo helps promote collaboration.**

Hippo is a powerful platform. We want to make it easy to manage the apps and
services you deploy.

## What languages can I use with Hippo?

Hippo can serve any WebAssembly module that was compiled with support for [Web
Application System Interface or WASI][wasi].  We provide support (in `yo-wasm`)
for the following languages:

- AssemblyScript
- C
- Rust
- Swift

Other languages that can compile to `wasm32-wasi`, like Zig and Grain, will
also work. You will just need to write your `HIPPOFACTS` file from scratch.

Many other languages are working on their WebAssembly support. But a language
must have a compiler target for WASI before it can be used in Hippo.

## What workloads are suited for Hippo?

At this time, applications running on Hippo are executed under a CGI-like
runtime powered by WebAssembly. As a result, Hippo is best suited for
web applications and micro-services, however in the future we do hope to expand
to further use cases once [WASI][wasi] matures.

[wasi]: {{< relref "webassembly.md#webassembly-system-interface-wasi" >}}
[wasm]: {{< relref "webassembly.md" >}}
