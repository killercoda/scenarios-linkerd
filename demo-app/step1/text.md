
Linkerd has been installed like described [here](https://linkerd.io/getting-started).

View the installed version:

```plain
linkerd version
```{{exec}}

Check the installed version:

```plain
linkerd check
```{{exec}}


### Install Emojivoto
We enable side injection for the new namespace:

```plain
kubectl create ns emojivoto
kubectl annotate ns emojivoto linkerd.io/inject=enabled
```{{exec}}


Now install the [Emojivoto](https://linkerd.io/2.11/getting-started/#step-4-install-the-demo-app) demo app:

```plain
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml \
  | kubectl apply -f -
kubectl -n emojivoto wait deploy --all --for condition=available --timeout=1h
```{{exec}}


### Access without Linkerd
For testing we can access the app directly **without** Linkerd:

```plain
kubectl -n emojivoto port-forward --address 0.0.0.0 svc/web-svc 8080:80
```{{exec}}

Then [ACCESS]({{TRAFFIC_HOST1_8080}}) the app directly <small>(or [select the port here]({{TRAFFIC_SELECTOR}}))</small>.


### Access with Linkerd
Linkerd uses [existing K8s Ingress solutions](https://linkerd.io/2.11/tasks/using-ingress) for traffic.

The Nginx Ingress Controller has been installed which is why we can create a new Ingress resource:

```plain
kubectl -f /root/emojivoto-ingress.yaml apply
```{{exec}}

We then port-forward to the Nginx Ingress Controller service:

```plain
kubectl port-forward -n ingress-nginx --address 0.0.0.0 service/ingress-nginx-controller 1234:80
```{{exec}}

Finally [ACCESS]({{TRAFFIC_HOST1_1234}}) the app through Linkerd <small>(or [select the port here]({{TRAFFIC_SELECTOR}}))</small>.
