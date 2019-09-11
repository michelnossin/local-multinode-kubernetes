# Kubernetes application local

If you are new to Kubernetes you might be better of using MiniKube. However using a multi node cluster on your own pc is nice because it mimicks real clusters better and like Minikube does not use the cloud and is therefor free. This makes it a good R&D environment.

This sample projects shows:
- How to create a sample http server in GO language.
- How to create a Docker container using the binary
- How to install and configure Ambassador as the Kubernetes Ingress Controller
- How to deploy it to a multi node kubernetes cluster (locally)
- Prevent Kubernetes pulling from a Docker repository

Prereq:
- Install DIND (Docker in Docker) https://hub.docker.com/r/mirantis/kubeadm-dind-cluster/
- Kubectl , Helm , Docker installed, GO installed

After cloning the git project to your pc:

1 Build binary rest server, create a container and start using Docker.
```
./scripts/build.sh
```

Test in browser: localhost:8090/michel should shows some results

2 Start Kubernetes
```
cd <your dind dir>
./dind-cluster-v1.13.sh up
```

3 Install Ambassador ingress controller
```
./scripts/install_ambassador.sh
```

4 Prepare local Docker registry
```
./scripts/prepare-docker-registry.sh  (only needed to run ONCE)
./scripts/start-docker-repository.sh
./scripts/test-repo.sh
```

5 Install Hello World
```
./scripts/conf-kubernetes.sh
```

6 Test, first we need our IP's 
```
kubectl get nodes -o wide
```

Shows the local ip's of the DIND kubernetes cluster. Use one in the following url (type in browser); (note /helloworld/<some text> is required!)
http://10.192.0.2:30000/helloworld/michel should show some nice results in the browser
