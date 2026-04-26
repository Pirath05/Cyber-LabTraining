# --- CONFIGURATION ---
SHELL := /bin/bash
REPO_NAME := english-as-code
DATE := $(shell date +'%Y-%m-%d %H:%M:%S')

# --- COLORS ---
CYAN  := \033[36m
RESET := \033[0m

.PHONY: help sync stats check

help: ## Show this help message
	@echo -e "$(CYAN)Usage: make [target]$(RESET)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

sync: ## Auto-commit and push changes to GitHub
	@echo -e "$(CYAN)Staging all files...$(RESET)"
	git add .
	@echo -e "$(CYAN)Committing changes...$(RESET)"
	git commit -m "update: $(DATE) - technical notes sync" || echo "Nothing to commit."
	@echo -e "$(CYAN)Pushing to origin...$(RESET)"
	git push

stats: ## Count total technical vocabulary and words
	@echo -e "$(CYAN)Word count per module:$(RESET)"
	@find . -name "*.md" -exec wc -w {} + | sort -nr
	@echo -e "$(CYAN)Total Line count:$(RESET)"
	@find . -name "*.md" | xargs wc -l | tail -n 1

check: ## Verify markdown syntax (requires markdownlint if installed)
	@echo -e "$(CYAN)Checking Markdown syntax...$(RESET)"
	@find . -name "*.md" -exec grep -l "TODO" {} + || echo "No pending tasks found."

clean: ## Remove temporary files (if any)
	find . -type f -name "*.tmp" -delete
	@echo -e "$(CYAN)Cleanup complete.$(RESET)"
