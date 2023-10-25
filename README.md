
# Kubernetes-Autoscaling
















export KUBECONFIG=/root/demo_kube_config

kubectl apply -f nginx-deployment.yaml


installing the VPA:

$ git clone https://github.com/kubernetes/autoscaler.git
$ cd autoscaler/vertical-pod-autoscaler
$ ./hack/vpa-up.sh


$ kubectl apply -f nginx-deployment-vpa.yaml


$ kubectl get vpa
NAME                   MODE   CPU   MEM       PROVIDED   AGE
nginx-deployment-vpa   Auto   25m   262144k   True       6m27s

$ kubectl describe vpa nginx-deployment-vpa


```yaml
Recommendation:
  Container Recommendations:
    Container Name:  nginx
    Lower Bound:
      Cpu:     25m
      Memory:  262144k
    Target:
      Cpu:     25m
      Memory:  262144k
    Uncapped Target:
      Cpu:     25m
      Memory:  262144k
    Upper Bound:
      Cpu:     6703m
      Memory:  7008683098
```




------------------   kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh




kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10





https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

https://github.com/vmware-archive/tgik/tree/master/episodes/126