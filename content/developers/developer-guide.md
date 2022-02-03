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
[webpack](https://webpack.js.org/).

## Setup

To get started either install the prerequisite tools locally or use a containerized environment.

### 1. Install locally

Install the following development tools and then clone the repository.:

- [.NET 6](https://dotnet.microsoft.com/download/dotnet/6.0)
- [Node.js](https://nodejs.org/en/download/)
- [npm](https://www.npmjs.com/get-npm)
- [WAGI](https://github.com/deislabs/wagi)
- [bindle](https://github.com/deislabs/bindle)

### 2. Use Visual Studio Code Remote Containers

Alternatively, development and testing can be done in a remote container using the [Visual Studio Code Remote Containers](https://code.visualstudio.com/docs/remote-containers) extension.

Using this approach, you can run the development inside a container without installing anything locally, other than the prerequisites for [Visual Studio Code Remote Containers](https://code.visualstudio.com/docs/remote/containers#_getting-started).

1. Clone the Hippo repository locally.
1. Start VS Code
1. Run the **`Remote-Containers: Open Folder in Container...`** command and select the local folder.

You can also use the [devcontainer cli](https://code.visualstudio.com/docs/remote/devcontainer-cli) to open Visual Studio Code and connect to the container.

```console
devcontainer open hippo
```

### 3. Use GitHub Codespaces

If you have access to [GitHub Codespaces](https://github.com/features/codespaces) then you can fork the Hippo repository and create a codespace.

Navigate to the main page of the newly forked repository. Under the repository name, use the Code drop-down menu, and in the Codespaces tab, click New codespace:

![New Codespace](/images/codespace.png)

## Building

To build the project, run:

```console
$ dotnet build
```

## Running

```console
$ cd src/Web
$ dotnet run
```

Then, open https://localhost:5309 to view the browser.

## Testing

```console
$ dotnet test
```

## Migrations

```
dotnet ef migrations add <name> --project src/Infrastructure --startup-project src/Web --context PostgresqlDbContext
dotnet ef migrations add <name> --project src/Infrastructure --startup-project src/Web --context SqliteDbContext
```

## Backing out

If you foul up your dev configuration beyond repair, or just want a clean
start, delete `src/Web/hippo.db`.
