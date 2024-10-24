include .env

init:
	minikube start --memory 8192 --cpus 4 --driver docker --container-runtime docker
	minikube addons enable ingress
	minikube addons enable ingress-dns
	flux check --pre

bootstrap:
	echo "$(GITHUB_TOKEN)" | flux bootstrap github --token-auth --owner=$(GITHUB_USER) --repository=minikube-flux-cpu-book --branch=master --path=./clusters/dev --personal

stop:
	minikube stop