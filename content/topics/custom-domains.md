---
title: Custom Domains
description: Configuring DNS for custom domains.
type: docs
---

By default, a Hippo app is available at a default domain which has the form of
`{name of app}.hippo.localdomain`. For example, an app named `myapp` can be
reached at `myapp.hippo.localdomain`.

To make your app available at a different domain, you can add a custom domain.
You can add custom domains to any app.

A short summary of steps to follow are:

1. Confirm you own the domain name. You can buy a custom domain at any domain
   registrar.
1. Add the custom domain to your application.
1. Look up the DNS target provided by Hippo.
1. Configure your app's DNS provider to point to the Hippo-supplied DNS target
1. Confirm your app is accessible via the custom domain. There might be a delay
   while changes propagate.

## Configuring DNS for Custom Domains

After you add a domain, you need to point your DNS provider at the DNS target
provided by Hippo.

You usually configure a new A record with your DNS provider to point it at
Hippo.

The following table shows common A record patterns:

| Record | Name    | Target        |
|------- |---------|---------------|
| A      | www     | 192.168.1.100 |
| A      | blog    | 192.168.1.100 |
| A      | staging | 192.168.1.100 |

You can also use a wildcard:

| Record | Name    | Target        |
|------- |---------|---------------|
| A      | *       | 192.168.1.100 |

Consult your DNS provider's documentation for specific instructions on creating
A records.

You can confirm that your DNS is configured correctly with the `host` command,
assuming your DNS changes have propagated:

```
$ host docs.hippofactory.dev
docs.hippofactory.dev has address 172.67.129.47
docs.hippofactory.dev has address 104.21.1.112
docs.hippofactory.dev has IPv6 address 2606:4700:3036::ac43:812f
docs.hippofactory.dev has IPv6 address 2606:4700:3033::6815:170
```

## Rules on Adding Domains

Any Hippo user can attempt to add domains to their app. Instead of explicit
domain ownership verification, Hippo enforces the following rules to ensure
domains aren't claimed by multiple owners:

1. A given domain can only be added to a single Hippo app. For example, if you
   add `www.example.com` to `hello-world`, you cannot add that domain to
   `goodbye-world` without removing the domain from `hello-world` first.
1. Adding wildcard domains to applications are unsupported at this time.
