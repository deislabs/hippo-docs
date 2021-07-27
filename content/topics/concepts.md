---
title: Concepts
description: Understanding the concepts and methodology behind the Hippo project
type: docs
---

## Twelve-Factor Applications

In the modern era, software is commonly delivered as a service. These services are commonly referred as "web applications", or "software-as-a-service".

The [Twelve-Factor App](https://12factor.net/) is a methodology for building modern web applications that can be deployed at scale following modern developer best practices.

Twelve-factor is a valuable synthesis of years of experience deploying software-as-a-service applications at scale in the wild, particularly on platforms like [Heroku](https://www.heroku.com/), [Cloud Foundry](https://www.cloudfoundry.org/), and the now-defunct [Deis Workflow](https://github.com/deis/workflow).

The maintainers of the Hippo project have been directly involved in the development and deployment of countless web applications, and some of the maintainers are from the original Deis team.

Hippo is designed to run applications that adhere to the Twelve-Factor App methodology and best practices.

## Common Gateway Interface

At the current writing of this document, the WebAssembly specification does not support attaching, creating, or writing to a socket. Additionally, WebAssembly modules are single-threaded. As a result, WebAssembly modules cannot initiate connections to other services or run as a standalone web server without blocking the main thread.

To work around this limitation, Hippo deploys applications as HTTP handlers following the [Common Gateway Interface](https://en.wikipedia.org/wiki/Common_Gateway_Interface) using a project called [WAGI](https://github.com/deislabs/wagi). An incoming HTTP request is sent to Hippo, which redirects the request to WAGI. WAGI then launches the application as a WebAssembly module, passing the HTTP request to the module. The output of the application - usually in the form of HTML - is returned to WAGI, and WAGI relays the output back to the browser as an HTTP response.

in the future as more capabilities are provided to the WebAssembly runtime, we will re-evaluate this architecture and provide more capabilities to developers.

## Bindle

Bindle is the term for a versioned package that can contain multiple objects of different types, or aggregate object storage.
Each item in a bindle is called a **parcel**.

Parcels can be any arbitrary data such as:

* WebAssembly modules
* Templates
* Web files such as HTML, CSS, JavaScript, and images
* Machine learning models
* Any other files that your application relies upon

A bindle for a website could look like this:

```
my-web-app 1.2.3
  |- index.html
  |- style.css
  |- library.js
  |- pretty-picture.jpg
```

Bindles are not just an alternative to a zip file.
They can also express **groups** and **relationships** between its parcels.
By associating related parcels into groups, a client can make decisions about which parcels it needs to download, and only retrieve what it needs.
A parcel can be associated with more than one group, which is useful for common components.

Take for example a fantasy football prediction application, with three groups defined:

* Frontend UI
* Backend that uses a machine learning model
* Backend that uses a statistical prediction model

The frontend group would contain HTML, images, and JavaScript files and is a required group.
The frontend specifies that it requires a backend, which could be the "machine-learning" backend or the "statistical" backend.
When the application is run, the frontend group and its parcels are downloaded, and depending on the client's configuration, one of the backend groups and their parcels are downloaded as well.
A client with plenty of time and resources might select the machine learning backend, while a constrained client might pick the faster statistical formulas.

Individual parcels in a bindle are _content addressable_ and can be retrieved independently.
Parcels can be cached by the client and reused across bindles.
For example, if three bindles all contained jquery v3.6.0, then the parcel is downloaded when the first bindle is run, and it is retrieved from the cache when the other two bindles are run.

## Bindle Server

A Bindle server provides storage for bindles.
Bindle servers provide tools for uploading, searching, and downloading bindles.
Additionally, they provide signature-based verification and provenance information so that you can assess the reliability of a bindle.

A particular bindle is identified by its _name and version_.
For example, `hello/1.2.3` is a valid reference for a bindle, while `hello` is not.
Often, bindle names are qualified with additional information,
so it is not uncommon to see bindles with references like `example.com/herbert_the_hippo/hello/1.2.3`

Once a bindle is uploaded to a Bindle server, that bindle is _immutable_.
It cannot be changed.
For example, if some part of `hello/1.2.3` is changed locally, you will need to change the version before pushing it to a Bindle server.

## Bindle CLI

Bindle does include a CLI (called `bindle`) for working directly with Bindle servers.
You can use this tool to upload and download bindles, and also to search a Bindle server.
Hippo does not require the `bindle` CLI.
Instead, it provides its [own CLI](#hippo-cli) for working with Bindle.

## Hippo Server

The Hippo server is a Platform as a Service (PaaS) layer for creating WebAssembly-based microservices and web applications.
It provides a browser-based portal, an API for the client CLI, and the backend management features to work with Bindle servers, load balancers, and Wagi.

## Hippo CLI

The hippo command-line tool.

## Wagi

Wagi takes a Hippo application and runs it.
It starts up an HTTP server and maps the routes to the modules, as you defined them in your `HIPPOFACTS` file.

Wagi relies upon the CGI/1.1 specification.
Any WebAssembly module that uses CGI conventions can run in a Wagi server.

When you are using the Hippo PaaS, you do not need to directly work with Wagi.
However, it is possible to locally test your WebAssembly code by executing Wagi directly.
This can be useful if you are locally debugging before pushing your code to a shared environment.
