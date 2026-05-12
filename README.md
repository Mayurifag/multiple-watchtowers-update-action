# Multiple Watchtowers Update Action

[![Linters](https://github.com/Mayurifag/multiple-watchtowers-update-action/actions/workflows/lint.yml/badge.svg)](https://github.com/Mayurifag/multiple-watchtowers-update-action/actions/workflows/lint.yml)

Triggers many (or one) [Watchtower](https://watchtower.nickfedor.com/) HTTP API update endpoints in parallel.

## Secrets

Create two repository secrets:

~~~text
WATCHTOWER_URLS=https://watchtower-one.example.com/v1/update https://watchtower-two.example.com/v1/update
WATCHTOWER_TOKENS=token-one token-two
~~~

If `WATCHTOWER_TOKENS` has one token, it is used for every URL. One URL triggers one deploy.

## Usage example

~~~yaml
jobs:
  update-watchtowers:
    runs-on: ubuntu-latest
    steps:
      - uses: Mayurifag/multiple-watchtowers-update-action@master
        with:
          watchtower-urls: ${{ secrets.WATCHTOWER_URLS }}
          watchtower-tokens: ${{ secrets.WATCHTOWER_TOKENS }}
~~~

## Inputs

| Name                | Description                        |
| :------------------ | :--------------------------------- |
| `watchtower-urls`   | Space-separated `/v1/update` URLs. |
| `watchtower-tokens` | One token or one token per URL.    |

## Watchtower

Watchtower must expose `POST /v1/update` with bearer auth:

~~~text
--http-api-update
~~~
