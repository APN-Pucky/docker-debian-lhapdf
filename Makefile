name  = apnpucky/docker-debian-lhapdf
build:
	docker build -t $(name) .
push: build
	docker push $(name)
