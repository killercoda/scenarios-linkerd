FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE}
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh
echo 'export PATH=$PATH:/root/.linkerd2/bin' >> .bashrc
export PATH=$PATH:/root/.linkerd2/bin
/root/.linkerd2/bin/linkerd install | kubectl apply -f -
echo "### WAIT FOR LINKERD TO BE READY ### (this can take a few minutes)"
kubectl -n linkerd wait deploy --all --for condition=available --timeout=1h