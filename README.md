# Dockerfile and Github action for publishing JSII packages

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/udondan/jsii-publish)][releases]
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/udondan/jsii-publish)][hub]
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/udondan/jsii-publish)][hub-builds]
[![Docker Pulls](https://img.shields.io/docker/pulls/udondan/jsii-publish)][hub]

Currently package building and publishing to npm, PyPI and NuGet is supported. Maven publishing is yet missing.

Example usage in a GitHub workflow:

```yml
---
name: Publish packages

on:
  create:
    tags:
      - v*

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Get the version
        id: get_version
        run: echo ::set-output name=VERSION::${GITHUB_REF/refs\/tags\/v/}

      - uses: actions/checkout@v1
        with:
          fetch-depth: 1

      - uses: udondan/jsii-publish@v0.5.1
        with:
          BUILD: true
          VERSION: ${{ steps.get_version.outputs.VERSION }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
          PYPI_TOKEN: ${{ secrets.PYPI_TOKEN }}
          NUGET_TOKEN: ${{ secrets.NUGET_TOKEN }}
```

Example usage for running the Docker image locally:

```bash
docker run -it \
    --workdir /workdir \
    --volume $(pwd):/workdir \
    --env VERSION=0.3.0 \
    --env BUILD=true \
    --env NPM_TOKEN \
    --env PYPI_TOKEN \
    --env NUGET_TOKEN \
    udondan/jsii-publish:0.5.1
```

The package code can be mounted to any location in the container. Just make sure you set the workdir to the same value. In the example above I use `/workdir`.

Parameters passed per env:

- **VERSION**: If set, the version in `package.json` will be updated with this value
- **BUILD**: If `true`, all configured JSII packages will be built
- **NPM_TOKEN**: Your publish token for npm. If passed, package will be published to npm
- **PYPI_TOKEN**: Your publish token for PyPI. If passed, package will be published to PyPI
- **NUGET_TOKEN**: Your publish token for NuGet. If passed, package will be published to NuGet

   [hub]: https://hub.docker.com/r/udondan/jsii-publish
   [hub-builds]: https://hub.docker.com/r/udondan/jsii-publish/builds
   [releases]: https://github.com/udondan/jsii-publish/releases
