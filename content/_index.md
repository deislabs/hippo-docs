---
title: Hippo
type: docs
no_list: true
---

Hippo is an open source Platform as a Service (PaaS), making it easier to
deploy and manage applications following modern cloud-native best practices.

Hippo includes capabilities for building and deploying applications from
source, simple application configuration, automatically deploying and rolling
back releases, managing domain names, providing seamless edge routing, log
aggregation, and sharing applications with other teams. All of this is exposed
through beautiful web interface and simple-to-use developer tooling.

Under the hood, Hippo takes advantage of several modern cloud-native tools like
WebAssembly to provide a safe, secure, sandboxed environment to compile,
deploy, run, and manage applications.

Here at DeisLabs we are cooking up a better ways to develop and run WebAssembly
workloads. Not familiar with WebAssembly? Take a quick tour of [WebAssembly in
a Hurry]({{< relref "topics/webassembly.md" >}}) to get up to speed.

Our goal is to provide a platform for developers to take advantage of modern
technologies without having to dive into the technical details of hosting.

We are also focused on providing a platform for cloud engineers looking for a
secure and safe runtime platform for their developers, with all the bells and
whistles required to deploy applications with ease.

# Getting Started

To get started with Hippo, follow our [Quick Start Guide]({{< relref
"intro/quickstart.md" >}}).

Take a deep dive into Hippo in our [Topic Guides]({{< relref "topics" >}}).

[How-to Guides]({{< relref "howto" >}}) are recipes. They guide you through the
steps involved in addressing key problems and use-cases. They are more advanced
than tutorials and assume some knowledge of how Hippo works.

# Project Status

Hippo is experimental code. It is not considered production-grade by its
developers, nor is it "supported" software. However, it is ready for you to try
out and provide feedback.

DeisLabs is experimenting with many WebAssembly technologies right now. This is
one of a multitude of projects (including [Krustlet, the WebAssembly
Kubelet](https://github.com/deislabs/krustlet)) designed to test the limits of
WebAssembly as a cloud-based runtime.
