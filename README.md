# Multiple Watchtowers Update Action

[![Linters](https://github.com/Mayurifag/multiple-watchtowers-update-action/actions/workflows/lint.yml/badge.svg)](https://github.com/Mayurifag/multiple-watchtowers-update-action/actions/workflows/lint.yml)

Composite GitHub Action that triggers several Watchtower HTTP API update endpoints from one workflow run.

## Why

If one project is deployed to several servers, every server can have its own Watchtower instance. This action lets a project workflow notify all of them after publishing a Docker image.

## Secrets

Create numbered secret pairs in each project repository that uses this action:

~~~text
WATCHTOWER_URL_1=https://watchtower.example.com/v1/update
WATCHTOWER_HTTP_API_TOKEN_1=secret-token-for-first-watchtower
WATCHTOWER_URL_2=https://watchtower.other.example.com/v1/update
WATCHTOWER_HTTP_API_TOKEN_2=secret-token-for-second-watchtower
~~~

Indexes must be positive numbers. Missing pairs fail the action, so a URL without a token or a token without a URL is treated as a configuration error.

## Usage

~~~yaml
name: Deploy

"on":
  workflow_dispatch:
  push:
    branches:
      - master

jobs:
  update-watchtowers:
    runs-on: ubuntu-latest
    steps:
      - uses: Mayurifag/multiple-watchtowers-update-action@master
        env:
          WATCHTOWER_URL_1: ${{ secrets.WATCHTOWER_URL_1 }}
          WATCHTOWER_HTTP_API_TOKEN_1: ${{ secrets.WATCHTOWER_HTTP_API_TOKEN_1 }}
          WATCHTOWER_URL_2: ${{ secrets.WATCHTOWER_URL_2 }}
          WATCHTOWER_HTTP_API_TOKEN_2: ${{ secrets.WATCHTOWER_HTTP_API_TOKEN_2 }}
~~~

## Inputs

| Name | Default | Description |
| :--- | :------ | :---------- |
| `url-prefix` | `WATCHTOWER_URL` | Environment variable prefix for Watchtower URLs. |
| `token-prefix` | `WATCHTOWER_HTTP_API_TOKEN` | Environment variable prefix for Watchtower API tokens. |
| `timeout-seconds` | `300` | Maximum time for each Watchtower request. |

## Watchtower

The target Watchtower container must be started with HTTP API update support enabled, for example:

~~~text
--http-api-update
~~~

The URL should point to the update endpoint, usually `/v1/update`.

## Development

~~~sh
make ci
~~~
