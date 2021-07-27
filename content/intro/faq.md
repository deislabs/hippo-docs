---
title: FAQ
description: Answers to frequently asked questions about Hippo.
type: docs
weight: 10
---

* [What languages can I use with Hippo? Why isn't my favorite language supported?](#what-languages-can-i-use-with-hippo-why-isnt-my-favorite-language-supported)
* [What workloads are suited for WebAssembly?](#what-workloads-are-suited-for-webassembly)

## What languages can I use with Hippo? Why isn't my favorite language supported?

Hippo can serve any WebAssembly module that was compiled with support for [Web Application System Interface or WASI][wasi].
We provide explicit support (in `yo-wasm`) for the following languages: **AssemblyScript, C, Rust, and Swift**.
Other languages that can compile to `wasm32-wasi`, like Zig and Grain, will also work.
You will just need to write your `HIPPOFACTS` file from scratch.

Many other languages are working on their WebAssembly support. But a language must have
support for the WASI specification before it can be used in Hippo.

[wasi]: {{< relref "webassembly.md#webassembly-system-interface-wasi" >}}

## What workloads are suited for Hippo?

Considering the [benefits and limitations of WebAssembly][wasm], some workloads are better suited for running on Hippo than others.
Hippo is designed specifically for microservices and web applications.

[wasm]: {{< relref "webassembly.md" >}}
