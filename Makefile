.PHONY: rails-new
rails-new:
	docker-compose run dev rails new ./ --database=postgresql --force --no-deps
