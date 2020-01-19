# JSII Publish Test

This is a test package, created by [JSII Publish](https://github.com/udondan/jsii-publish) to test the publishing functionality of the Docker image.

## Version description

- The package version is prefixed with the version of the Docker image.
- Next comes an identifier of the source:
  - 1: [GitHub Workflow](https://github.com/udondan/jsii-publish/blob/master/.github/workflows/pr-test.yml)
  - 2: TravisCI
  - 3: CircleCI
- A random number between 1 and 999

Example: Version 0.8.3**1**677 means it is the Docker image version 0.8.3, pushed from GitHub Workflow with a random number of 677.
