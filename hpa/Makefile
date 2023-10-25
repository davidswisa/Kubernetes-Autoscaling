
run:
	kubectl apply -f php-deployment.yaml

run-pa:
	kubectl apply -f php-deployment-hpa.yaml

load:
	kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

watch:
	watch -d kubectl get hpa php-apache

clean: clean-php

clean-php:
	kubectl delete hpa php-apache || true
	kubectl delete service php-apache || true
	kubectl delete deployment.apps/php-apache || true
