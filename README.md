<a href="https://coredns.io/">
    <img src="https://coredns.io/images/CoreDNS_Colour_Horizontal.png" alt="CoreDNS" height="86px">
</a><br /><br />

A customized CoreDNS tailored for [@socheatsok78](https://github.com/socheatsok78), built with the following modules:

- [gslb](https://github.com/dmachard/coredns-gslb)

To use this image, simply pull it from the GitHub Container Registry and use it as your base image in your Dockerfile:

```Dockerfile
ARG COREDNS_VERSION
FROM ghcr.io/socheatsok78/coredns-prime:${COREDNS_VERSION}
```

[Source](https://coredns.io/) | [GitHub Container Registry](https://github.com/users/socheatsok78/packages/container/package/coredns-prime)

## License
This project is licensed under the [BSD-2-Clause](LICENSE) license. See the LICENSE file for details.
