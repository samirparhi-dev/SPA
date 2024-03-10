### Create the Redis master pod
- Step 1: Use the redis-master-controller.yaml file to create the Redis master replication controller in your Kubernetes cluster by running the kubectl create -f filename command:

`$ kubectl create -f examples/guestbook-go/redis-master-controller.yaml`

- Step 2:  verify that the redis-master controller is up

` $ kubectl get rc `

- Step 3: verify that the redis-master pod is running
` kubectl get pods `

### Create the Redis master service

- Step 1: Use the redis-master-service.yaml file to create the service in your Kubernetes cluster by running the kubectl create -f filename command:

` $ kubectl create -f redis-master-service.yaml`

- Step 2: verify that the redis-master service is up:

` kubectl get services `

###  Create the Redis replica pods

- Step 1: Use the file redis-replica-controller.yaml to create the replication controller:

` $ kubectl create -f k8s/guestbook-go/redis-replica-controller.yaml `

- Step 2:verify that the redis-replica controller is running:

` kubectl get rc `

### Create the Redis replica service

- Step 1: Use the redis-replica-service.yaml file to create the Redis replica service:

` $ kubectl create -f k8s/guestbook-go/redis-replica-service.yaml`

- Step 2:verify that the redis-replica service is up:

` $ kubectl get services `

### ---------------------End-------------------