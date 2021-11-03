.PHONY: start stop start worker-start log docker master worker clean
	
start:
	docker-compose up -d

stop:
	docker-compose down

worker-start:
	docker run --rm -it \
		-e BUILDMASTER=192.168.1.27 \
		-e BUILDMASTER_PORT=9989 \
		-e WORKERNAME=ubuntu2004-ty-1 \
		-e WORKERPASS=pass \
		yezune/buildbot-worker 

log:
	docker-compose logs -f 
	
docker: master worker

master:
	docker build -t yezune/buildbot-master master -f Dockerfile.master

worker:
	docker build -t yezune/buildbot-worker worker -f Dockerfile.worker

clean:
	docker image rm -f yezune/buildbot-master
	docker image rm -f yezune/buildbot-worker
