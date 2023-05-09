# ArgoCD

---


# Notes



Sorry for the crappy pdf but conversion from markdown to pdf sucks

Using ArgoCD for continious delivery on a kubernetes kluster. 
Demo application is [guest-book](https://github.com/nikolaev-i/ArgoOps/tree/master/helm-guestbook)

---


- Current status of kluster
   - running two replica sets everything in sync

  ![1](imgs/1.png)



- changes to the master branch
  - increasing replicas 
  - 
  ![2](imgs/2.png)



- Syncing the deployed cluster with the master branch
  ![3](imgs/3.png)