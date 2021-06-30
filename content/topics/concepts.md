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

To work around this limitation, Hippo deploys applications as HTTP handlers following the [Common Gateway Interface](https://en.wikipedia.org/wiki/Common_Gateway_Interface) using a project called [WAGI](). An incoming HTTP request is sent to Hippo, which redirects the request to WAGI. WAGI then launches the application as a WebAssembly module, passing the HTTP request to the module. The output of the application - usually in the form of HTML - is returned to WAGI, and WAGI relays the output back to the browser as an HTTP response.

in the future as more capabilities are provided to the WebAssembly runtime, we will re-evaluate this architecture and provide more capabilities to developers.
