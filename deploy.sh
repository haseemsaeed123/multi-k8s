docker build -t haseemsaeed1/multi-client:latest -t haseemsaeed1/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t haseemsaeed1/multi-server:latest -t haseemsaeed1/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t haseemsaeed1/multi-worker:latest -t haseemsaeed1/multi-worker:$SHA -f ./worker/Dockerfile ./wokrer
docker push haseemsaeed1/multi-client:latest
docker push haseemsaeed1/multi-server:latest
docker push haseemsaeed1/multi-worker:latest
docker push haseemsaeed1/multi-client:$SHA
docker push haseemsaeed1/multi-server:$SHA
docker push haseemsaeed1/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=haseemsaeed1/multi-server:$SHA
kubectl set image deployments/client-deployment client=haseemsaeed1/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=haseemsaeed1/multi-worker:$SHA
