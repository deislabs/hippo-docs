---
title: FAQ
type: docs
weight: 10
---

* [What languages can I use with Hippo? Why isn't my favorite language supported?](#what-languages-can-i-use-with-hippo-why-isnt-my-favorite-language-supported)
* [What workloads are suited for WebAssembly?](#what-workloads-are-suited-for-webassembly)

## What languages can I use with Hippo? Why isn't my favorite language supported?

Hippo can serve any WebAssembly module that was compiled with support for [Web Application System Interface or WASI][wasi].
Currently those languages are **AssemblyScript, C, Rust, and Swift**.

Other languages such as C#, Python and JavaScript will hopefully support WASI in the future.

[wasi]: {{< relref "webassembly.md#webassembly-system-interface-wasi" >}}

## What workloads are suited for WebAssembly?

Considering the [benefits and limitations of WebAssembly][wasm], some workloads are better suited for running on WebAssembly than others. Microservices that interact over the network would be a prime candidate.

[wasm]: {{< relref "webassembly.md" >}}
