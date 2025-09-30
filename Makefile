MAKEARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

# Default command for 'make'
_list_commands:
	sh -c "echo 'Available commands:'; $(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | grep -v 'Makefile'| sort"

# ----------------------------------------------------------------
# Docker: Compose
# ----------------------------------------------------------------

_docker_check_yaml:
	if [ ! -f docker-compose.yml ]; then ln -sf docker-compose.simple.yml docker-compose.yml; fi
_docker_check: \
	_docker_check_yaml

docker-build: _docker_check
	docker compose build
docker-up: _docker_check
	docker compose up -d
docker-down: _docker_check
	docker compose down
docker-start: _docker_check
	docker compose start
docker-stop: _docker_check
	docker compose stop
docker-rm: _docker_check
	docker compose --force --stop
docker-run: \
	docker-build \
	docker-up

# Fix arguments
%:
	@:
