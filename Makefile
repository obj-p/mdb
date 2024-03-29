## Contributing

.PHONY: brew
brew:
	@brew bundle --no-lock

.PHONY: pre-commit-autoupdate
pre-commit-autoupdate:
	@pre-commit autoupdate

.PHONY: pre-commit-install
pre-commit-install:
	@pre-commit install
