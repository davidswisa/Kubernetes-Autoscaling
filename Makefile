# PodAutoscaler Type
TYPE := vpa
export TYPE


run:
	$(MAKE) -C $(TYPE) run

run-pa:
	$(MAKE) -C $(TYPE) run-pa

load:
	kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

watch:
	$(MAKE) -C $(TYPE) watch

info:
	$(MAKE) -C $(TYPE) info

clean: clean-php

clean-php:
	kubectl delete hpa php-apache || true
	kubectl delete service php-apache || true
	kubectl delete deployment.apps/php-apache || true

