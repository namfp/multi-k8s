docker build -t namnguyen107/multi-client:lates -t namnguyen107/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t namnguyen107/multi-server:lates -t namnguyen107/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t namnguyen107/multi-worker:lates -t namnguyen107/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push namnguyen107/multi-client:latest 
docker push namnguyen107/multi-server:latest 
docker push namnguyen107/multi-worker:latest
docker push namnguyen107/multi-client:$SHA
docker push namnguyen107/multi-server:$SHA
docker push namnguyen107/multi-worker:$SHA 
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=namnguyen107/multi-server:$SHA
kubectl set image deployments/client-deployment client=namnguyen107/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=namnguyen107/multi-worker:$SHA
