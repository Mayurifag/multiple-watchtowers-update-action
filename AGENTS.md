# Project Notes

This repository is a composite GitHub Action for triggering several Watchtower HTTP API endpoints from one workflow.

Keep token and URL values out of logs. Downstream repositories pass numbered secrets as environment variables named `WATCHTOWER_URL_1`, `WATCHTOWER_HTTP_API_TOKEN_1`, `WATCHTOWER_URL_2`, `WATCHTOWER_HTTP_API_TOKEN_2`, and so on.

Run `make ci` before finishing changes.
