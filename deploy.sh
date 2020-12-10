docker build -t lexarflash8g/multi-client:latest -t lexarflash8g/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lexarflash8g/multi-server:latest -t lexarflash8g/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lexarflash8g/multi-worker:latest -t lexarflash8g/multi-worker:$SHA-f ./worker/Dockerfile ./worker
docker push lexarflash8g/multi-client:latest
docker push lexarflash8g/multi-server:latest
docker push lexarflash8g/multi-worker:latest
docker push lexarflash8g/multi-client:$SHA
docker push lexarflash8g/multi-server:$SHA
docker push lexarflash8g/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lexarflash8g/multi-server:$SHA
kubectl set image deployments/client-deployment client=lexarflash8g/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lexarflash8g/multi-worker:$SHA

