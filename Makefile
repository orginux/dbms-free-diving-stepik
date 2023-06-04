CONTAINER_NAME="dbms-free-diving-pg"
TASK ?=

up:
	docker compose up -d
down:
	docker compose down
psql:
	docker exec -it ${CONTAINER_NAME} psql -U postgres
homework: up
	docker exec ${CONTAINER_NAME} /tmp/home-work/prepare.sh ${TASK}
