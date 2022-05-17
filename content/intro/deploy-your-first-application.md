---
title: Deploy your First Application
description: Deploy your first application using Hippo
type: docs
weight: 4
---

Now let's deploy your first application using Hippo!

## Gather your materials

We need a few tools for this tutorial:

1. The [Hippo CLI](https://github.com/deislabs/hippo-cli)
1. The [Spin CLI](https://spin.fermyon.dev/)
1. The [Rust programming language](https://www.rust-lang.org/)

The latest release of the Hippo CLI can be downloaded from the [GitHub releases
page](https://github.com/deislabs/hippo-cli/releases).

The latest release of the Spin CLI can be downloaded from the [GitHub releases
page](https://github.com/fermyon/spin/releases).

After installing Rust, make sure to have the `wasm32-wasi` target available:

```console
$ rustup target add wasm32-wasi
info: component 'rust-std' for target 'wasm32-wasi' is up to date
```

## Building the example application

To build and run the Spin example applications, clone the Spin repository:

```console
$ git clone https://github.com/fermyon/spin
Cloning into 'spin'...
remote: Enumerating objects: 3114, done.
remote: Counting objects: 100% (570/570), done.
remote: Compressing objects: 100% (176/176), done.
remote: Total 3114 (delta 444), reused 402 (delta 391), pack-reused 2544
Receiving objects: 100% (3114/3114), 6.81 MiB | 27.56 MiB/s, done.
Resolving deltas: 100% (1491/1491), done.
```

Let’s explore the Rust example from the examples/http-rust directory:

```console
$ cd spin/examples/http-rust
$
```

Here is the `spin.toml`, the definition file for a Spin application:

```toml
spin_version = "1"
authors = ["Fermyon Engineering <engineering@fermyon.com>"]
description = "A simple application that returns hello."
name = "spin-hello-world"
trigger = { type = "http", base = "/" }
version = "1.0.0"

[[component]]
id = "hello"
source = "target/wasm32-wasi/release/spinhelloworld.wasm"
[component.trigger]
route = "/hello"
```

This represents a simple Spin HTTP application (triggered by an HTTP request),
with a single component called `hello`. Spin will execute the
`spinhelloworld.wasm` WebAssembly module for HTTP requests on the route
`/hello`. See Spin's [configuration
guide](https://spin.fermyon.dev/configuration) for a detailed guide on the Spin
application configuration.

Now let’s have a look at the `hello` component
(`examples/http-rust/src/lib.rs`). Below is the complete source code for a Spin
HTTP component written in Rust — a regular Rust function that takes an HTTP
request as a parameter and returns an HTTP response, and it is annotated with
the `http_component` macro:

```rust
use anyhow::Result;
use spin_sdk::{
    http::{Request, Response},
    http_component,
};

/// A simple Spin HTTP component.
#[http_component]
fn hello_world(req: Request) -> Result<Response> {
    println!("{:?}", req);
    Ok(http::Response::builder()
        .status(200)
        .header("foo", "bar")
        .body(Some("Hello, Fermyon!".into()))?)
}
```

We can build this component using the regular Rust toolchain, targeting
`wasm32-wasi`, which will produce the WebAssembly module and place it at
`target/wasm32-wasi/release/spinhelloworld.wasm` as referenced in `spin.toml`:

```console
$ cargo build --target wasm32-wasi --release
    Finished release [optimized] target(s) in 0.01s
```

Now that we configured the application and built our component, we can _spin
up_ the application (pun intended):

```console
$ spin up --file spin.toml
Serving HTTP on address http://127.0.0.1:3000
```

Spin will instantiate all components from the application configuration, and
will create the router configuration for the HTTP trigger accordingly. The
component can now be invoked by making requests to
<http://localhost:3000/hello>:

```console
$ curl http://localhost:3000/hello
Hello, Fermyon!
```

To push your application to Bindle, use `spin bindle push`:

```console
$ spin bindle push --bindle-server http://localhost:8080/v1 --file spin.toml 
pushed: spin-hello-world/1.0.0
```

Now that we've published our application, let's deploy it to Hippo!

## Deploy to Hippo

Register an account using the Hippo CLI.

```console
$ hippo register -k
Enter username: administrator
Enter password: [hidden]
Registered administrator
```

Then log in.

```console
$ hippo login -k
Enter username: administrator
Enter password: [hidden]
Logged in as administrator
```

Create a new application. The second argument must match the bindle ID we used
earlier with `spin bindle push`, but the first argument can be anything we'd
like.

```console
$ hippo app add helloworld spin-hello-world
Added App helloworld (ID = 'e4a30d14-4536-4f4a-81d5-80e961e7710c')
IMPORTANT: save this App ID for later - you will need it to update and/or delete the App
```

By default, Hippo will serve the application to a domain URL with the address
`.<app_name>.<platform_domain>`. In this case, `helloworld.hippo.localdomain`.
If you want your browser to resolve this hostname to Hippo, you'll want to add
it to your `/etc/hosts` file (or `c:\Windows\System32\Drivers\etc\hosts` for
Windows users):

```console
$ cat /etc/hosts
127.0.0.1	localhost
::1		localhost


127.0.0.1   helloworld.hippo.localdomain
```

Open your web browser to <https://helloworld.hippo.localdomain:5309/hello> and
accept the self-signed certificate. You should see "Hello, Fermyon!".

## Summary

Congratulations! You just deployed your first application to Hippo!

The beginner tutorial ends here. In the meantime, you might want to check out
some pointers on [where to go from here]({{< relref "whatsnext.md" >}}).
