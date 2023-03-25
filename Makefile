#!/usr/bin/env make -f
SHELL = /bin/bash

include .env

.ONESHELL:

install:
	@clear
	@echo "* Installing docker..."
	@./install-docker.sh
run:
	@clear
	@echo "* Starting Machine Learning Environment..."
	@docker run --rm --name lab_ml -d -w /home/jovyan/work \
			-v "${PWD}":/home/jovyan/work -p 8888:8888 \
			jupyter/datascience-notebook:python-3.10
	@clear
	@docker logs lab_ml
	@clear
	@echo "* Starting Machine Learning Bash..."
	@docker exec -it lab_ml bash
stop:
	@clear
	@echo "* Stoping Machine Learning Environment..."
	@docker stop lab_ml
	@echo ""
restart: stop run
	@echo "Restarting Machine Learning Environment..."