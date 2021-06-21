---
title: WebAssembly in a Hurry
description: A quick tour of WebAssembly and related technologies that Hippo is built upon
type: docs
weight: 50
---

Let's take a quick tour of WebAssembly to get you familiar with foundations of Hippo.

* [WebAssembly (wasm)](#webassembly-wasm)
* [WebAssembly System Interface (WASI)](#webassembly-system-interface-wasi)
* [What workloads are suited for WebAssembly?](#what-workloads-are-suited-for-webassembly)

### WebAssembly (wasm)

Write your application once in a language that supports compiling to WebAssembly (wasm), and then run on any target machine regardless of operating system or CPU architecture.
Some languages, such as C/C++, Swift and Rust, already have out-of-the-box support for compiling to wasm, so you are already ahead of the game developing in a familiar language and using your existing developer tools.
Other languages that rely upon a runtime, for example Python or Go, and require a bit more work to use the full capabilities of the language when targeting wasm.

Though originally WebAssembly was intended to execute in the web browser, it can be executed outside the web browser too.
Either way WebAssembly modules execute in a sandbox, isolated from the host computer that is running the module.
Modules cannot access host resources such as the filesystem or host network, and do not run as root.

If you are familiar with Docker containers, this will sound familiar.
Containers can also be isolated, however they don't execute in a true sandbox in the same way that WebAssembly does.
Containers execute as processes directly on the host machine and use Linux functionality such as namespaces and cgroups to isolate the container.
WebAssembly modules execute are compiled binaries that execute inside a WebAssembly virtual machine.
Solomon Hykes famously [tweeted](https://twitter.com/solomonstre/status/1111004913222324225?s=20):

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">If WASM+WASI existed in 2008, we wouldn&#39;t have needed to created Docker. That&#39;s how important it is. Webassembly on the server is the future of computing. A standardized system interface was the missing link. Let&#39;s hope WASI is up to the task! <a href="https://t.co/wnXQg4kwa4">https://t.co/wnXQg4kwa4</a></p>&mdash; Solomon Hykes (@solomonstre) <a href="https://twitter.com/solomonstre/status/1111004913222324225?ref_src=twsrc%5Etfw">March 27, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Some languages such as AssemblyScript, C, C#, Go, Rust, and Swift support compiling to target **wasm**, so that the resulting binary is ready to be executed by a WebAssembly runtime.
There are many WebAssembly runtimes out there, such as [wasmtime] (used by Hippo) and [wasm3].

[wasmtime]: https://wasmtime.dev/
[wasm3]: https://github.com/wasm3/wasm3

### WebAssembly System Interface (WASI)

This isolation is great for security, but poses a challenge to developers when implementing traditional workloads.
Questions immediately come up such as _How do I serve static files associated with my application?_ or _How do I communicate via sockets?_

WebAssembly System Interface (WASI) defines an API through which WebAssembly modules that are not running in a web browser can interact with its environment and the outside world.
WASI is a modular interface, and is still evolving, but for the moment the most interesting bits of WASI enable a module to interact with the filesystem and networking.

Not all languages support WASI yet, currently AssemblyScript, C, Rust, and Swift can be compiled to target **wasm32-wasi** so that WASI support is baked into the resulting binary.

### WebAssembly Gateway Interface (WAGI)

WebAssembly Gateway Interface (WAGI) allows you to run WebAssembly WASI binaries as HTTP handlers, and was inspired by CGI.
Back in the day, web servers such as Apache, had support for writing HTTP request handlers in any language, as long as it adhered to the Common Gateway Interface (CGI).
CGI was the precursor to what we now call Functions as a Service, or Serverless, and WAGI takes the next step so that you can define your functions in WebAssembly.

A WAGI compliant server can be configured with mappings that define a WebAssembly binary that should handle a path, such as all requests for /calculator are routed to calculator.wasm, and the response is returned back to the client.

WebAssembly Gateway Interface was created by Deis Labs, and is currently defined a few documents that build off of CGI and highlight the differences.

* [WAGI Architecture](https://github.com/deislabs/wagi/blob/main/docs/architecture.md)
* [WAGI Environment Variables](https://github.com/deislabs/wagi/blob/main/docs/environment_variables.md)
* [Writing a WAGI Module](https://github.com/deislabs/wagi/blob/main/docs/writing_modules.md)

WAGI is currently supported two servers: a standalone [WAGI Server](https://github.com/deislabs/wagi) and an extension of .NET with [WAGI.NET](https://github.com/deislabs/wagi-dotnet).

### What workloads are suited for WebAssembly?

Considering the benefits and limitations of WebAssembly, some workloads are better suited for running on WebAssembly than others. Microservices that interact over the network would be a prime candidate. 

