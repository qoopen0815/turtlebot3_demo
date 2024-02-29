start:
	docker compose up -d --build

stop:
	docker compose down

clean:
	docker image prune -a --force
	docker images --filter dangling=true #lists all images that are dangling and has no pointer to it

clear_cache:
	docker builder prune -f
	