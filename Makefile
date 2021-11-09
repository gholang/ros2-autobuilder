.PHONY: init simple start stop start worker-start log docker master worker clean

init:
	git submodule init
	
start:
	docker-compose up -d

simple:
	docker-compose up -d janitor buildbot worker2004-ty-1

stop:
	docker-compose down --remove-orphans

log:
	docker-compose logs -f 
	
docker: master worker

master:
	docker build -t yezune/buildbot-master:latest master -f master/Dockerfile

worker:
	docker build -t yezune/buildbot-worker:latest worker -f worker/Dockerfile

clean:
	docker image rm -f yezune/buildbot-master
	docker image rm -f yezune/buildbot-worker
