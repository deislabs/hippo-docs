---
title: Install Hippo
description: Install the latest Hippo Command Line Interface.
type: docs
weight: 2
---

The Hippo CLI is available as a pre-compiled binary for several operating
systems. You can also compile Hippo from source.

## Manual Installation

You can download a pre-compiled binary and run it on your PC or laptop. You can
also verify the binary using the available checksums and attached PGP
signatures. The releases are [available on
GitHub](https://github.com/deislabs/hippo-cli/releases).

After downloading the Hippo CLI, unzip the package. Make sure that the `hippo` binary
is available somewhere on your `$PATH` before continuing with the other guides.

You can check the locations available on your path by running this command:

```console
$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
```

The output is a list of directories separated by colons. You can `mv` Hippo to
one of the directories listed, or by adding Hippo's current directory to your
`$PATH`.

{{< tip >}}
For Linux/MacOS users: You can permanently add a new location to your path by
editing your shell's settings file (usually called something like
`$HOME/.bashrc`). In that file, you can add a new line that starts with `export
PATH=`, followed by a colon-separated list of locations. Add the location of
the Hippo binary to that list and save the file. Then reload your shell's
configuration with the command `source $HOME/.bashrc`.
{{< /tip >}}

{{< tip >}}
For Windows users: You can permanently add a new location to your path by
navigating to your system settings (\<Win> --> "Edit Environment Variables for
your Account"), click "Environment Variables...", and under "User variables",
select the variable named `Path`, then click "Edit...". Add the Hippo binary's
location to that list, reboot your machine, and launch a new console window.
{{< /tip >}}

## From Source

To compile from source, you will need
[Rust](https://www.rust-lang.org/tools/install) installed and configured
properly, as well as a copy of `git` in your `$PATH`.

Depending on your operating system, you may also need to install `pkg-config`
and `libssl-dev` via `apt` or other similar package managers.

Clone the hippo-cli repository from GitHub:

```console
$ git clone https://github.com/deislabs/hippo-cli
$ cd hippo-cli
```

Then, compile and install Hippo:

```console
$ cargo install --path .
```

## Verify the Installation

To verify Hippo was installed correctly, try running `hippo --version`:

```console
$ hippo --version
hippo {{< hippo-cli-latest-version >}}
```
