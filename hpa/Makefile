POD_NAME := $(shell kubectl get pods | grep "apache" | awk '{print $$1}')

run:
	kubectl apply -f php-deployment.yaml

run-pa:
	kubectl apply -f php-deployment-hpa.yaml

load:
	kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

watch:
	watch -d kubectl get hpa php-apache

info:
	kubectl describe pod $(POD_NAME)
