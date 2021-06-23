---
title: Hippo
type: docs
no_list: true
---

Here at Deis Labs we are cooking up a better ways to develop and run WebAssembly workloads with the Hippo project and a few other supporting components. Not familiar with WebAssembly? Take a quick tour of [WebAssembly in a Hurry][wasm] to get up to speed.

**Hippo** streamlines deploying and serving WebAssembly so that you can focus on your app.
You can package your Web Assembly module with any supporting files, such as static HTML files and images, and then deploy your application to a server optimized for WebAssembly services.


> Lookout, hungry hungry hippos are serving up your web assembly. Omnomnom, yum! <img src="/images/hippo.png" width="64px" />


Our goal is a Platform as a Service (PaaS) that makes it easier for a developer to create a WebAssembly module and quickly get it up and running, without having to dive into the complexities of hosting.

## <i class="fas fa-file-code"></i> Author

Scaffold a WebAssembly module using [Yeoman] for AssemblyScript, C, Rust, or Swift.
Develop your application with familiar languages and proven tools.

[Yeoman]: https://yeoman.io/

## <i class="fas fa-rocket"></i> Push

Publish a new version of your application when you push to GitHub.

## <i class="fas fa-play"></i> Serve

Register your application with Hippo, where it will handle serving, load balancing, and provisioning https certificates for you.
New versions of your application are automatically deployed so you can focus on your app, not the infrastructure.


[wasm]: webassembly/