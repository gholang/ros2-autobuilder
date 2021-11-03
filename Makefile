.PHONY: init start stop start worker-start log docker master worker clean

init:
	git submodule init
	
start:
	docker-compose up -d

stop:
	docker-compose down

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
