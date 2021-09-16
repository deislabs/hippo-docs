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

## System Requirements

Install the following development tools:

- [.NET 5](https://dot.net/)
- [Node.js](https://nodejs.org/en/download/)
- [npm](https://www.npmjs.com/get-npm)
- [WAGI](https://github.com/deislabs/wagi)

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
