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

Some programming languages, such as Go, Rust or C, are compiled languages.
You select the operating system and CPU architecture where the code is going to execute, and it is turned into machine code suitable to run in that environment.
If you support many operating systems and architectures, such as macos amd64, macos arm64 (aka M1), windows amd64, linux amd64, linux arm64, and so on, that you can spend a lot of time re-compiling your application for each combination.

**Wouldn't it be great if you could compile your application once and run it anywhere?**

When you compile your application to WebAssembly, that is what happens!
Write your application once in a language that supports compiling to WebAssembly (wasm), and then run on any target machine regardless of operating system or CPU architecture.
This is possible because WebAssembly relies upon a WebAssembly runtime available on the target machine.
The compiled output isn't native machine code, and instead is byte code that is capable of being executed by a WebAssembly runtime.

A WebAssembly runtime handles executing a module in a _sandbox_, isolated from the host computer that is running the module.
Modules cannot access host resources such as the filesystem or host network, and do not run as root.
Though originally WebAssembly was intended to execute in the web browser, it can be executed outside the web browser too.

If you are familiar with Docker containers, this will sound familiar.
Containers can also be isolated, however they don't execute in a true sandbox in the same way that WebAssembly does.
Containers execute as processes directly on the host machine and use Linux functionality such as namespaces and cgroups to isolate the container.
WebAssembly modules execute are compiled binaries that execute inside a WebAssembly virtual machine.
Solomon Hykes famously [tweeted](https://twitter.com/solomonstre/status/1111004913222324225?s=20):

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">If WASM+WASI existed in 2008, we wouldn&#39;t have needed to created Docker. That&#39;s how important it is. Webassembly on the server is the future of computing. A standardized system interface was the missing link. Let&#39;s hope WASI is up to the task! <a href="https://t.co/wnXQg4kwa4">https://t.co/wnXQg4kwa4</a></p>&mdash; Solomon Hykes (@solomonstre) <a href="https://twitter.com/solomonstre/status/1111004913222324225?ref_src=twsrc%5Etfw">March 27, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Some languages such as AssemblyScript, C, C#, Go, Rust, and Swift support compiling to target **wasm**, so that the resulting binary is ready to be executed by a WebAssembly runtime.
There are many WebAssembly runtimes out there, such as [wasmtime] (used by Hippo) and [wasm3].
This means that you can often continue coding in your favorite language and with familiar developer tools and immediately target WebAssembly immediately.

[wasmtime]: https://wasmtime.dev/
[wasm3]: https://github.com/wasm3/wasm3

### WebAssembly System Interface (WASI)

Running in an isolated sandbox is great for security, but poses a challenge to developers when implementing traditional workloads.
Questions immediately come up such as _How do I serve static files associated with my application?_ or _How do I communicate via sockets?_

WebAssembly System Interface (WASI) defines an API through which WebAssembly modules that are not running in a web browser can interact with its environment and the outside world, specifically with the filesystem and network.

Not all languages support WASI yet, currently AssemblyScript, C, Rust, and Swift can be compiled to target **wasm32-wasi** so that WASI support is baked into the resulting binary.

### WebAssembly Gateway Interface (WAGI)

Another common question that immediately comes up is _Can I use WebAssembly to implement microservices_? Luckily the answer will soon be yes!

WebAssembly Gateway Interface (WAGI) allows you to run WebAssembly WASI binaries as HTTP handlers, and was inspired by CGI.
Back in the day, web servers such as Apache, had support for writing HTTP request handlers in any language, as long as it adhered to the Common Gateway Interface (CGI).
CGI was the precursor to what we now call Functions as a Service, or Serverless, and WAGI takes the next step so that you can define your functions in WebAssembly.

A WAGI compliant server can be configured with mappings that define a WebAssembly binary that should handle a path, such as all requests for /calculator are routed to calculator.wasm, and the response is returned back to the client.

WebAssembly Gateway Interface was created by [Deis Labs], and is currently defined in a few documents that build off of CGI and highlight the differences:

* [WAGI Architecture](https://github.com/deislabs/wagi/blob/main/docs/architecture.md)
* [WAGI Environment Variables](https://github.com/deislabs/wagi/blob/main/docs/environment_variables.md)
* [Writing a WAGI Module](https://github.com/deislabs/wagi/blob/main/docs/writing_modules.md)

WAGI is currently supported two servers: a standalone [WAGI Server](https://github.com/deislabs/wagi) and an extension of .NET with [WAGI.NET](https://github.com/deislabs/wagi-dotnet).
Though existing web servers could implement WAGI and support running WebAssembly modules too.

[Deis Labs]: https://deislabs.io