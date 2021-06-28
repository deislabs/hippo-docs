---
title: Hippo
type: docs
no_list: true
---

Here at Deis Labs we are cooking up a better ways to develop and run WebAssembly workloads with the Hippo project and a few other supporting components. Not familiar with WebAssembly? Take a quick tour of [WebAssembly in a Hurry][wasm] to get up to speed.

**Hippo** streamlines deploying and serving WebAssembly so that you can focus on your app.
You can package your Web Assembly module with any supporting files, such as static HTML files and images, and then deploy your application to a server optimized for WebAssembly services.


> Lookout, hungry hungry hippos are serving up your web assembly. Omnomnom, yum! {{% hippo %}}


Our goal is a Platform as a Service (PaaS) that makes it easier for a developer to create a WebAssembly module and quickly get it up and running, without having to dive into the complexities of hosting.

![drawing of Hippo architecture](/images/hippo-architecture.png)

### <i class="fas fa-file-code"></i> Author

Scaffold a WebAssembly module using [Yeoman] for AssemblyScript, C, Rust, or Swift.
Develop your application with familiar languages and proven tools, and then compile to WebAssembly.

[Yeoman]: https://yeoman.io/

### <i class="fas fa-rocket"></i> Push

Package your module and any supporting files into a **bindle** and then push it to a **bindle hub**.

### <i class="fas fa-user-plus"></i> Register

Register your application with a **Hippo** server, defining a deployment **channel** which specifies whether an exact version should be deployed, or the latest version from a version range.

### <i class="fas fa-play"></i> Serve

Hippo keeps an eye out for new versions of your application by querying a bindle server.
New versions that match your channel settings are automatically deployed.
Hippo serves the assets in your application's bindle, load balances the application, and provisions https certificates for you.

[wasm]: webassembly/