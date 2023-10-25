
# Kubernetes-Autoscaling

Kubernetes offers multiple levels of capacity management control for autoscaling. this mechanisms can be are:

- [Horizontal Pod Autoscaling (HPA)]()
- [Vertical Pod Autoscaling (VPA)]()
- [The Kubernetes Cluster Autoscaler]()



## Horizontal Pod Autoscaling (HPA)
Horizontal scaling means that the response to increased load is to deploy more Pods. This is different from vertical scaling, which for Kubernetes would mean assigning more resources (for example: memory or CPU) to the Pods that are already running for the workload.

If the load decreases, and the number of Pods is above the configured minimum, the HorizontalPodAutoscaler instructs the workload resource (the Deployment, StatefulSet, or other similar resource) to scale back down.

![Horizontal Pod Autoscaling](./images/hpa.png)

## Vertical Pod Autoscaling (VPA)

Vertical Pod Autoscaler (VPA) frees users from the necessity of setting up-to-date resource limits and requests for the containers in their pods. When configured, it will set the requests automatically based on usage and thus allow proper scheduling onto nodes so that appropriate resource amount is available for each pod. It will also maintain ratios between limits and requests that were specified in initial containers configuration.

It can both down-scale pods that are over-requesting resources, and also up-scale pods that are under-requesting resources based on their usage over time.

Autoscaling is configured with a Custom Resource Definition object called VerticalPodAutoscaler. It allows to specify which pods should be vertically autoscaled as well as if/how the resource recommendations are applied.

![Vertical Pod Autoscaling](./images/vpa.png)

## The Kubernetes Cluster Autoscaler





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





## for more info

- https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
- https://www.densify.com/kubernetes-autoscaling/kubernetes-vpa/
- https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/
- https://github.com/vmware-archive/tgik/tree/master/episodes/126