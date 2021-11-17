---
title: Configure an application with HIPPOFACTS
linkTitle: Configuration
type: docs
---

A Hippo application's configuration resides in its HIPPOFACTS, or Hippo
artifacts, file. It defines metadata about the application such as the name,
version, associated WebAssembly modules and the routes they handle, and static
files that should be deployed with the application. The Hippo command-line tool
generates a [bindle] from the HIPPOFACTS file and pushes it to a Bindle server.

{{< important >}}
Once a bindle version has been pushed, it is immutable and you must change the
version to push it again.
{{< /important >}}

Below is an example HIPPOFACTS file for an application, BirdsOnDemand, that
shows you awesome birds.  The application has three endpoints:

* `/birds/flightless` handled by penguin.wasm that deploys with images of some
  birds, such as the adelie and rockhopper.
* `/birds/irritable/fighty` handled by cassowary.wasm that does not deploy any
  additional files.
* `/birds/naughty` handled by kea.wasm that deploys with an image of a kea
  bird.

```toml
[bindle]
  name = "BirdsOnDemand"
  version = "1.2.3"
  description = "Provides birds as a service"
  authors = ["Joan Q Programmer"]

[[handler]]
  route = "/birds/flightless"
  name = "bin/penguin.wasm"
  files = ["photo/adelie.png", "photo/rockhopper.png", "stock/*.jpg"]

[[handler]]
  route = "/birds/irritable/fighty"
  name = "bin/cassowary.wasm"

[[handler]]
  route = "/birds/naughty"
  name = "bin/kea.wasm"
  files = ["stock/kea.jpg", "stock/wipers.jpg"]
```

### \[bindle\]

The bindle section defines metadata about your application:

- **name**: The name of the application
- **version**: The application version. Follows [semver v2][semver] and does
  not allow a leading v prefix.
- **description**: OPTIONAL. A plain text description of the application.
- **authors**: OPTIONAL. A list of author names.

### [[handler]]

The handler entries can be repeated as many times as needed.  Handlers define
endpoints for your application and the WebAssembly module that should receive
requests.

- **route**: The request path. It should start a leading forward slash "/", and
  does not support wildcards.
- **name**: Relative path to the WebAssembly module (*.wasm file) that should
  handle the request.
- **files**": OPTIONAL. A list of relative file paths of static files that
  should be deployed with the WebAssembly module. These files are available to
  the module when it is serving requests.


[semver]: https://semver.org/spec/v2.0.0.html
[bindle]: {{< relref "/topics/concepts.md#bindle" >}}
