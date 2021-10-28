.PHONY: start stop worker-start worker-stop log docker master-img worker-img clean
	
start:
	docker-compose up -d

worker-start:
	docker run --rm -it \
		-e BUILDMASTER=192.168.1.27 \
		-e BUILDMASTER_PORT=9989 \
		-e WORKERNAME=ubuntu2004-ty-1 \
		-e WORKERPASS=pass \
		yezune/buildbot-worker 

log:
	docker-compose logs -f 
stop:
	docker-compose down
	
docker: master worker

initial:
	mkdir tmp
	
master-img: initial
	docker build -t yezune/buildbot-master tmp -f Dockerfile.master

worker-img: initial
	docker build -t yezune/buildbot-worker tmp -f Dockerfile.worker

clean:
	docker image rm -f yezune/buildbot-master
	docker image rm -f yezune/buildbot-worker
