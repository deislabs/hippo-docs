---
title: Developer Guide
description: Want to contribute code to the Hippo project? Start here
type: docs
---

This guide explains how to set up your environment for developing Hippo.

Hippo is a .NET webapp, built with the
[Model-View-Controller](https://docs.microsoft.com/en-us/aspnet/core/tutorials/first-mvc-app/start-mvc?view=aspnetcore-5.0&tabs=visual-studio)
(MVC) approach.

The front-end uses the Bootstrap design framework, which (along with some other
packages) is managed via [npm](https://www.npmjs.com/) and
[gulp](https://gulpjs.com/).

## Setup

To get started either install the prerequisite tools locally or use a containerized environment.

### 1. Install locally

Install the following development tools and then clone the repository.:

- [.NET 5](https://dot.net/)
- [Node.js](https://nodejs.org/en/download/)
- [npm](https://www.npmjs.com/get-npm)
- [WAGI](https://github.com/deislabs/wagi)

### 2. Use Visual Studio Code Remote Containers

Alternatively development and testing can be done in a remote container using the [Visual Studio Code Remote Containers](https://code.visualstudio.com/docs/remote-containers) extension.

Using this approach, you can run the development inside a container without installing anything locally, other than the prerequisites for [Visual Studio Code Remote Containers](https://code.visualstudio.com/docs/remote/containers#_getting-started).

1. Clone the Hippo repository locally. 
1. Start VS Code
1. Run the **`Remote-Containers: Open Folder in Container...`** command and select the local folder.

You can also use the [devcontainer cli](https://code.visualstudio.com/docs/remote/devcontainer-cli) to open Visual Studio Code and connect to the container.

```console
devcontainer open hippo
```

### 3. Use GitHub Codespaces

If you have access to [GitHub Codespaces](https://github.com/features/codespaces) then you can fork the Hippo repository and create a codespace.:

Navigate to the main page of the newly forked repository. Under the repository name, use the  Code drop-down menu, and in the Codespaces tab, click  New codespace:

![New Codespace](/images/codespace.png)

## Building

To build the project, run:

```console
$ dotnet restore
$ cd Hippo
$ npm run build
```

## Running

If you're using the deislabs bindle test server, make sure to install the Let's
Encrypt TLS certificates on your machine.

```console
$ sudo su
$ cd /usr/share/ca-certificates/
$ mkdir letsencrypt.org
$ cd $_
$ curl -o isrgrootx1.crt https://letsencrypt.org/certs/isrgrootx1.pem
$ curl -o lets-encrypt-r3.crt https://letsencrypt.org/certs/lets-encrypt-r3.pem
$ dpkg-reconfigure ca-certificates
$ update-ca-certificates
```

```console
$ export BINDLE_URL=https://bindle.deislabs.io/v1
$ dotnet run
```

Then, open https://localhost:5001 to view the browser.

## Testing

```console
$ dotnet test
```

## Migrations

We provide migrations for two databases: SQLite for local development,
PostgreSQL for production use. If you change the model then you need to create
migrations for both databases.  To do this:

```
export ASPNETCORE_ENVIRONMENT=Production
dotnet ef migrations add <name> --context SqliteDataContext --output-dir Migrations/Sqlite
dotnet ef migrations add <name> --context PostgresDataContext --output-dir Migrations/Postgres
```

Sometimes manual fix-ups are required:

* **SQLite:** EF generates `"now()"` for database-generated columns. This
  doesn't exist. Change it to `"datetime('now')"` in both the migration and the
  designer.

## Backing out

If you foul up your dev configuration beyond repair, or just want a clean
start, delete `Hippo/hippo.db`.
