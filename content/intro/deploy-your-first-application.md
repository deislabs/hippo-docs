---
title: Deploy your First Application
description: Deploy your first application using Hippo
type: docs
weight: 4
---

Now let's deploy your first application using Hippo!

## Prerequisites

Since we will be writing our application in Rust, we will need to [install
Rust](https://www.rust-lang.org/).

Make sure to have the `wasm32-wasi` target available:

```console
$ rustup target add wasm32-wasi
```
## Register an Account

Register an account using the Hippo CLI.

```console
$ hippo auth register --danger-accept-invalid-certs
Enter username: administrator
Enter password: [hidden]
Registered administrator
```

Then log in using your new account.

```console
$ hippo auth login --danger-accept-invalid-certs
Enter username: administrator
Enter password: [hidden]
Logged in as administrator
```

Make sure to log in to Bindle.

```console
$ hippo bindle login --danger-accept-invalid-certs
Configuration written to ~/.config/hippo/bindle.json
```

## Create an Application

Run the following commands to create a new application:

```console
$ hippo app add helloworld helloworld
Added App helloworld (ID = '1f077bb2-a021-4d2e-9b30-8067f7084f95')
IMPORTANT: save this App ID for later - you will need it to update and/or delete the App (for now)
$ hippo channel add latest 1f077bb2-a021-4d2e-9b30-8067f7084f95
Added Channel latest (ID = 'cad1a102-1eeb-4aec-9508-6c27c5204051')
IMPORTANT: save this Channel ID for later - you will need it to update and/or delete the Channel (for now)
```

At this point, you created a new application called `helloworld`, but it is not
serving any content... Yet. You need to compile your application to WebAssembly
and upload it to the Bindle server, and then push it to the Bindle server. Hippo
will discover the new version and deploy it.

Hippo's source code contains several example applications. We'll use the
helloworld example for this demonstration.

```console
$ cd hippo/examples/helloworld
```

Compile the application to WebAssembly:

```console
$ cargo build --release
```

Run your application locally to try it out. It should print "Hello, world!"

```console
$ wasmtime target/wasm32-wasi/release/helloworld.wasm
```

To push your application to Bindle, use the `hippo` CLI.

```console
$ hippo push . -v production
```

Open your web browser to <https://helloworld.hippofactory.io:5003> and
accept the self-signed certificate. You should see "Hello, world!".

![Hello World!](/images/hello-world.png)

## Summary

Congratulations! You just deployed your first application to Hippo!

The beginner tutorial ends here. In the meantime, you might want to check out
some pointers on [where to go from here]({{< relref "whatsnext.md" >}}).
