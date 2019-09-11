helm init
echo Wait some seconds
sleep 8
helm install --set service.http.nodePort=30000 stable/ambassador

