.PHONY: setup build import deploy check all

setup:
	ansible-galaxy collection install kubernetes.core

build:
	packer init nginx.pkr.hcl
	packer build nginx.pkr.hcl

import:
	k3d image import my-custom-nginx:v1 -c lab

deploy:
	ansible-playbook playbook.yml

check:
	kubectl get pods
	kubectl get svc

all: setup build import deploy
