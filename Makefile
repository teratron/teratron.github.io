
set_url: ## git remote set-url origin git@github.com:login/repo.git
	git remote set-url origin git@github.com:teratron/teratron.github.io.git

message = Update cheatsheet.
branch = master
add_commit_push: ## add commit push
	git add .
	git commit -m "$(message)"
	git push origin $(branch)

.PHONY: help
help:
	@awk '                                             \
		BEGIN {FS = ":.*?## "}                         \
		/^[a-zA-Z_-]+:.*?## /                          \
		{printf "\033[36m%-24s\033[0m %s\n", $$1, $$2} \
	'                                                  \
	$(MAKEFILE_LIST)

.DEFAULT_GOAL := help
