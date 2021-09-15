---
title: Deploy your First Application
description: Deploy your first application to Hippo
type: docs
weight: 3
---

Now let's deploy your first application to Hippo!

## Prerequisites

Since we will be writing our application in Rust, we will need to [install
Rust](https://www.rust-lang.org/).

Make sure to have the `wasm32-wasi` target available:

```console
$ rustup target add wasm32-wasi
```

## Install the Hippo CLI

The Hippo command-line interface (CLI) lets you interact with Hippo. Use the
CLI to create, configure, and manage applications.

Install the latest `hippo` CLI by going to the
[Release page](https://github.com/deislabs/hippo-cli/releases).

After fetching the latest release, you should move it somewhere on your $PATH:

```console
$ mv hippo /usr/local/bin/
```

## Install yo-wasm

`yo-wasm` generates new projects to be used with Hippo.

First, install [Yeoman](http://yeoman.io/) using `npm`. Then install
`generator-wasm` using `npm`.

```console
$ npm install -g yo
$ npm install -g generator-wasm
```

## Register an Account

Open your web browser to <https://localhost:5001> and accept the self-signed
certificate to view the Hippo Web UI.

![Hippo Web UI](/images/hippo-ui-not-logged-in.png)

Click "Register" and create a new account. Use "admin" for the username, enter
your email address, and use "Passw0rd!" for your password - we'll reference
these later when logging in with the Hippo CLI.

![Registration page](/images/hippo-register-account.png)

## Create an Application

Now go back to your terminal and use `yo wasm` to generate your application. To
auto-populate some fields, you can set up a few environment variables ahead of
time.

Note: We need to disable strict SSL certificate checking because our Hippo
server is using a self-signed certificate.

```console
$ export USER=admin
$ export HIPPO_USERNAME=admin
$ export HIPPO_PASSWORD='Passw0rd!'
$ export HIPPO_URL=https://localhost:5001
$ export BINDLE_URL=http://localhost:8080/v1
$ export GLOBAL_AGENT_FORCE_GLOBAL_AGENT=false
```

Create a new directory for your application.

```console
$ mkdir helloworld
$ cd $_
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
? What storage ID (bindle name) would you like for your Hippo app? admin/helloworld
? What domain name would you like for your Hippo app? helloworld.hippofactory.io
? Enter your Hippo user name (will become app owner) admin
? Enter your Hippo password *********
```

Open your web browser to <https://localhost:5001>, accept the self-signed
certificate, and log in. You should see an application named "helloworld" in
the list.

![Applications page with "helloworld" app](/images/hippo-applications-with-helloworld.png)

At this point, your application is registered with Hippo, but it is not yet
being served. You need to first compile the application, package it into a
bindle, and then push it to the Bindle server. Then Hippo will discover the new
version and deploy it.

Compile your application to WebAssembly with WASI support.

```console
$ cargo build --release --target wasm32-wasi
```

Run your application locally to try it out. It should print "Hello, world!"

```console
$ cargo run
```

To push your application to Bindle, use the `hippo` CLI.

```console
$ hippo push -k .
```

Open your web browser to <https://admin.helloworld.hippofactory.io:5003> and
accept the self-signed certificate. You should see "Hello, world!".

![Hello World!](/images/hello-world.png)

## Summary

Congratulations! You just deployed your first application to Hippo!

The beginner tutorial ends here. In the meantime, you might want to check out
some pointers on [where to go from here]({{< relref "whatsnext.md" >}}).
