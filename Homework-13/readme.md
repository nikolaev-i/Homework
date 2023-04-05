

# Kubernetes

---


# Notes

Runing a local cluster based on ARM processors doesn't work

---


1. Simple pods operations:

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


2. Working with pod manifest files:

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


