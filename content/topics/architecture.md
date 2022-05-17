---
title: Architecture
description: A deep dive into Hippo's architecture
type: docs
---

Hippo is built using a service-oriented architecture. All of Hippo's components
are open source and are available on GitHub.

# Overview

Administrators of the Hippo platform use nomad to configure and install Hippo's
components. Service discovery, application scheduling, and networking are all
delegated to nomad, while Hippo provides a clean and simple developer
experience.

<!--- Insert architecture overview document here -->

Hippo provides additional functionality to your nomad cluster, including:

- [The Hippo CLI](https://github.com/deislabs/hippo-cli) which assembles your
  application files as [bindles](https://github.com/deislabs/bindle)
- [A log aggregator](components.md#logger) which gathers logs from all of your
  application processes
- A simple REST API which powers the web interface and any external developer
  tooling
- automatic application release deployments
- Authentication and Authorization to application resources
- HTTP/HTTPS edge routing for your applications

# Schedulers

All platform components that are part of the Hippo platform expect to be
running on an existing nomad cluster. This means that you can happily run your
nomad-native workloads next to applications that are managed through Hippo.

# Application Layout and Edge Routing

The router component is responsible for routing HTTP/s traffic to your
applications as well as proxying platform API traffic.

The router component is part of the Hippo platform, and is provided by the
[Yet-Another-Reverse-Proxy (YARP)](https://github.com/microsoft/reverse-proxy)
project.

The router automatically discovers routable applications, SSL/TLS certificates
and application-specific configurations through the platform. Any changes to an
application's configuration is applied within milliseconds.
