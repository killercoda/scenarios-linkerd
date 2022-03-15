
Linkerd has been installed like described here:

https://linkerd.io/getting-started

Check the installed version:

```plain
linkerd version
```{{exec}}

Wait for all Linkerd component pods to be running:

```plain
watch kubectl get pod -A
```{{exec}}

You could now for example install the demo app:

https://linkerd.io/2.11/getting-started/#step-4-install-the-demo-app

Install the demo app:

```plain
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/emojivoto.yml \
  | kubectl apply -f -
```{{exec}}
