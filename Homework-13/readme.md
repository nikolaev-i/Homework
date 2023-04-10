

# Kubernetes

---


# Notes

Issues with local ARM based cluster - non comptabile images

Runing on AKS, with one slight issue in [probes_http](#4-probes/**liveness_http**) 

---


## 1. Simple pods operations:

No pods available after querying 

![ks](img/ks-01.png)

---

While using --all-namespaces we see pods(21) under the kube-system namespace. These pods are made and owned by the cluster - basically services that make using k8s possible 
![all](img/ks-02.png)

---

Afte executing *kubectl run nginx --image=nginx* and querying the pod is runing and well.
![nginx](img/ks-03.png)  

---

Runing *logs* gives information about the pod - version, process status etc
![logs](img/ks-04.png)  

---

Using *-o wide* gives us more information including the node where the pod is running
![wide](img/ks-05.png)  

---

Using *describe* gives us a detailed state of a pod
![describe](img/ks-06.png)

---

Container Image is pulled from a microsoft repository or better know as Microsoft Artifact Registry
![coredns](img/ks-07.png)

---

Logs from the metrics container - Errors aren't errors but information(go figure MS logging system)

![metrics](img/ks-08.png)

ToDo:
- What is a pod_nany

---


## 2. Working with pod manifest files:

For the sake of being brief I'll compare both files - wrong and correct versions.
- apiVersion is wrong for pods should be v1 not v11
- Formatting isn't according to yaml standard
- it's spec, not specs - typo
- image redis123 doesn't exist(we get a pull image error), we should check the image repo(Docker hub) for proper naming/version

![yaml](img/ks-09.png)

---

First run and we get a parsing error
![wrong](img/ks-10.png)

---

After the file has been corrected we get another error this time because of the image name

![image_name](img/ks-11.png)

---

And here we have a healthy pod with a container.
![running](img/ks-12.png)


---

nginx manifest
```yaml

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: frontend
spec:
  containers:
  - name: nginx-container
    image: nginx
    ports:
    - containerPort: 80


```

---

Memecache manifest

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: memcached-pod
  labels:
    app: web
spec:
  containers:
  - name: memcached-container
    image: memcached
    ports:
    - containerPort: 11211
    resources:
      requests:
        cpu: 350m
        memory: 150Mi
      limits:
        cpu: 500m
        memory: 250Mi
    restartPolicy: Never
  ```

  Both nignx and memcache running 
![running_pods](img/ks-13.png)


## 3. Multicontainer pods

Definition of our multicontainer pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginredis
  labels:
    app: frontend-backend
spec:
  containers:
  - name: nginx-container
    image: nginx:1.22.1
    ports:
    - containerPort: 80
  - name: redis-container
    image: redis:latest
    ports:
    - containerPort: 6379
```
---

The pod running with two containers inside 
![multainer](img/ks-14.png)

---

Both containers are pulled from their respective image adresses
![containers](img/ks-15.png)


---

## 4. Probes

- **liveness_exec**

Edited yaml file for probes_exec

```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-exec
spec:
  containers:
    - name: liveness
      image: k8s.gcr.io/busybox
      args:
        - /bin/sh
        - -c
        - touch /tmp/healthy; sleep 30; rm -rf /tmp/healthy; sleep 600
      livenessProbe:
        exec:
          command:
            - cat
            - /tmp/healthy
        initialDelaySeconds: 5
        periodSeconds: 5
```


Running the describe command - no failure yet
![describe](img/ks-15.5.png)

---


Getting the failure after 35 seconds.
![failure](img/ks-16.5.png)

---

Pod restarts have icremented
![reset](img/ks-16.png)


- **liveness_http**


```yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-http
spec:
  containers:
    - name: liveness
      image: k8s.gcr.io/liveness
      args:
        - /server
      livenessProbe:
        httpGet:
          path: /healthz
          port: 8080
          httpHeaders:
            - name: Custom-Header
              value: Awesome
        initialDelaySeconds: 3
        periodSeconds: 3
```
**healthz is implemented in Go**



Some issues related to running the healthz, might be related to incorrectly configured AKS 
![issues](img/ks-17.png)

ToDo:
- fix this 

---

- **probes_tcp**


```yaml
apiVersion: v1
kind: Pod
metadata:
  name: liveness-tcp
labels:
  app: goproxy
spec:
  containers:
  - name: goproxy
    image: k8s.gcr.io/goproxy:0.1
    ports:
    - containerPort: 8080
    livenessProbe:
      tcpSocket:
        port: 9999 # 8080 is a valid port
      initialDelaySeconds: 15
      periodSeconds: 20
```

liveness-tcp is up and running
![pod-is-up](img/ks-18.png)

Probe failure due to using port 9999 
![port-error](img/ks-19.png)


---

- **readiness_htpp**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: readiness-http
  labels:
    app: test
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    readinessProbe:
      httpGet:
        path: / 
        port: 80
        httpHeaders:
        - name: Host
          value: myapplication1.com
      initialDelaySeconds: 1
      periodSeconds: 2
      timeoutSeconds: 1
      successThreshold: 1
      failureThreshold: 
```
Pod is up and running
![up-and-running](img/ks-20.png)

No issues when running the *describe* command.
![no-issues](img/ks-20.5.png)


The pod is running but it's not ready
![not-running](img/ks-21.5.png)

Due to the change the probe fails.
![issues](img/ks-21.png)