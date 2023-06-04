CONTAINER_NAME="dbms-free-diving-pg"

up:
	docker compose up -d
down:
	docker compose down
psql:
	docker exec -it ${CONTAINER_NAME} psql -U postgres
hw-task-2: up
	docker exec ${CONTAINER_NAME} /tmp/home-work/HW2Task2/task2-public.sh
