# Readme

Segfault in GKE

```sh
<= GKE 1.19.9-gke.1900 (did not test higher version)
Container-Optimized OS with Docker (cos)
e2-highcpu-4 => 3.92 CPU + 2.96 GB (intel lake)
```

## Full Repro

```sh
git clone https://github.com/bodinsamuel/isolated-vm-repro.git

cd isolated-vm-repro

yarn

# Optional: The current image is already build and accessible
# You must replace sha256 in kube.yml
./build.sh

kubectl apply -f kube.yml

kubectl get pods

kubectl exec --stdin --tty <pod_name> -- /bin/bash

# Inside the pod
node index.js
```

<img src="screenshot.png">
