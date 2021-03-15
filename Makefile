SHELL := /bin/bash # Use bash syntax

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir_name := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

run:
	docker-compose run --rm app chown -R $(id -u):$(id -g) .
	docker-compose  up --build -d
	docker-compose run --service-ports --rm app

destroy:
	docker-compose down
	docker volume rm ${current_dir_name}_studying-elixir
	docker rmi ${current_dir_name}
