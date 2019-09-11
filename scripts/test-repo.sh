kubectl run helloworld --image=localhost:5000/helloworld:latest 
echo waiting some seconds to let our app start
sleep 6
kubectl get pods 
echo if you see a running hello world your are OK, we assume it did and delete the pod and deployment
kubectl delete deployments helloworld
