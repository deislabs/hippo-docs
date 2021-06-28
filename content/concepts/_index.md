---
title: Architecture
linkTitle: Concepts
description: Definitions of the various components of Hippo
type: docs
weight: 50
---

* [Bindle](#bindle)
* [Bindle Server](#bindle-server)
* [Bindle CLI](#bindle-cli)
* [Hippo Server](#hippo-server)
* [Hippo CLI](#hippo-cli)

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

Bindles are more than just a zip file, they can also express **groups** and **relationships** between its parcels.
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

## Bindle CLI

## Hippo Server

## Hippo CLI

The hippo command-line tool is currently named hippofactory, which will probably change in the near future.
