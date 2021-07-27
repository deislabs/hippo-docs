---
title: Deploy your First Application
description: Deploy your first application to Hippo.
type: docs
weight: 4
---

Open your web browser to <https://localhost:5001> and accept the self-signed
certificate to view the Hippo Web UI.

![Hippo Web UI](/images/hippo-ui-not-logged-in.png)

Click "Register" and create a new account.

![Registration page](/images/hippo-register-account.png)

Next, log in.

![Login page](/images/hippo-login.png)

Once you are logged in, you should be redirected to the Applications page.

![Applications page](/images/hippo-applications.png)

Now go back to your terminal and use `yo wasm` to generate your application. To
auto-populate some fields, you can set up a few environment variables ahead of
time.

```console
$ export HIPPO_URL=https://localhost:5001
$ export BINDLE_URL=http://localhost:8080/v1
$ export HIPPO_USERNAME=bacongobbler
```

Create a new directory for your application.

```console
$ mkdir helloworld
$ cd $_
```

Disable strict SSL certificate checking because our Hippo server is using a
self-signed certificate.

```console
$ export GLOBAL_AGENT_FORCE_GLOBAL_AGENT=false
```

Run `yo wasm`, answering the questions to generate your application.

```console
$ yo wasm
? What is the name of the WASM module? helloworld
? What type of application is the module? Web service or application using WAGI
? What is the name of the author? Matthew Fisher
? What programming language will you write the module in? Rust
? Where do you plan to publish the module? Hippo
? Would you like to install build tools (Rust WASI target)? Yes
? What is the URL of your Hippo service? https://localhost:5001
? What is the URL of your Hippo's Bindle server? http://localhost:8080/v1
? Would you like to create a new Hippo application for this project? Yes
? What storage ID (bindle name) would you like for your Hippo app? bacongobbler/helloworld
? What domain name would you like for your Hippo app? helloworld.hippos.rocks
? Enter your Hippo user name (will become app owner) bacongobbler
? Enter your Hippo password **********
```

Compile and run your application locally to try it out. It should print "Hello,
world!"

```console
$ cargo run
```

Open your web browser to the Applications page. You should see an application
named "helloworld" in the list.

![Applications page with "helloworld" app](/images/hippo-applications-with-helloworld.png)

At this point, your application is registered with Hippo, but it is not yet
being served. You need to first compile the application, package it into a
bindle, and then push it to the Bindle server. Then Hippo will note the new
version and deploy it.

Compile your application to WebAssembly with WASI support.

```console
$ cargo build --release --target wasm32-wasi
```

`yo wasm` generated a file named HIPPOFACTS, which defines how to package your
application into a bindle, and includes information for the WAGI runtime on how
to serve it.

To push your application to Bindle, use the `hippo` CLI.

```console
$ hippo push .
```

Open your web browser to `helloworld.hippos.rocks`. You should see "Hello,
world!"

![Hello World!](/images/hello-world.png)

## Summary

Congratulations! You just deployed your first application to Hippo!

The beginner tutorial ends here. In the meantime, you might want to check out
some pointers on [where to go from here]({{< relref "whatsnext.md" >}}).
