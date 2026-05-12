ACTIONLINT ?= go run github.com/rhysd/actionlint/cmd/actionlint@v1.7.7

.PHONY: ci
ci:
	editorconfig-checker
	yamllint .
	npx markdownlint-cli2 "**/*.{md,markdown}"
	$(ACTIONLINT)
