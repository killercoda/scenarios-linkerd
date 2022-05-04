
Linkerd has been installed like described [here](https://linkerd.io/getting-started).

View the installed version:

```plain
linkerd version
```{{exec}}

Check the installed version:

```plain
linkerd check
```{{exec}}


<br>

### Install Application

> Check our complete example of the [Demo App](https://killercoda.com/linkerd/scenario/demo-app)

You can now install any application you would like to access through Linkerd.

Make sure to enable namespace proxy injection like this:

```plain
kubectl create ns my-app
kubectl annotate ns my-app linkerd.io/inject=enabled
# todo install app
```{{exec}}



### Linkerd Ingress
Linkerd uses [existing K8s Ingress solutions](https://linkerd.io/2.11/tasks/using-ingress) for traffic.

The Nginx Ingress Controller has been installed which is why you can create Ingress resources [like this](https://linkerd.io/2.11/tasks/using-ingress/index.html#nginx).

Once done, port-forward to the Nginx Ingress Controller service:

```plain
kubectl port-forward -n ingress-nginx --address 0.0.0.0 service/ingress-nginx-controller 1234:80
```{{exec}}

Finally [ACCESS]({{TRAFFIC_HOST1_1234}}) the Nginx Ingress -> Linkerd <small>(or [select the port here]({{TRAFFIC_SELECTOR}}))</small>.
