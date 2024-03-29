## Contributing

.PHONY: brew
brew:
	@brew bundle --no-lock

.PHONY: pre-commit-install
pre-commit-install:
	@cp scripts/pre-commit.sh .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
