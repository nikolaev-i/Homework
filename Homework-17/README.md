# Ansible Labs

Welcome to Ansible Labs for the DevOps Academy 2023.

## How to use these Labs

To follow the exercises with Ansible you need to create your own environment for which you need to install VirtualBox as a type-2 hypervisor for virtualization and Vagrant for building your virtual environment.

You can install these tools the classic manual way:

* ### Install Oracle Virtual Box:  https://www.virtualbox.org/
* ### Install Vagrant: https://www.vagrantup.com/downloads.html


Or you can install them with a script:
```powershell
$ScriptFromGit = Invoke-WebRequest https://git.davchev.com/DevOps_Academy/ansible-labs/raw/branch/master/install_CVV-stack.ps1

Invoke-Expression $($ScriptFromGit.Content)
```
> **_NOTE:_**
The script will automatically restart your machine.

* ### In a new Directory copy this respository:
``` shell
git clone https://git.davchev.com/DevOps_Academy/ansible-labs.git
```

If you have successfully installed the necessary tools listed above, then you can proceed to the [first lab](ansible-lab1/README.md).



1. Setting up the lab 
    - setting up hosts 

```bash

192.168.1.43 loadbalancer
192.168.1.32 db01
192.168.1.133 web01
192.168.1.230 web02
192.168.1.209 ansible-control

```

  - testing ansible 

```zsh
╰─ ansible localhost -m command -a 
[WARNING]: No inventory was parsed, only implicit localhost is available
localhost | CHANGED | rc=0 >>
DESKTOP-5G4BDT7

```
 - testing webstack connectivity

```bash
ansible webstack -i hosts -m command -a hostname --user=vagrant

web01 | CHANGED | rc=0 >> web01
web02 | CHANGED | rc=0 >> web02
loadbalancer | CHANGED | rc=0 >> loadbalancer
db01 | CHANGED | rc=0 >> db01
```
Note: I'm using wsl as ansible-control with my own user name, so I have to add extra flags 


2. Ad-hoc-ing commands

- Testing some commands 
  ```bash
ansible webstack -i hosts -m shell -a uptime --user=vagrant 

loadbalancer | CHANGED | rc=0 >>
 10:56:02 up  1:38,  1 user,  load average: 0.00, 0.00, 0.00
web02 | CHANGED | rc=0 >>
 10:56:02 up  1:33,  1 user,  load average: 0.00, 0.00, 0.00
db01 | CHANGED | rc=0 >>
 10:56:02 up  1:37,  1 user,  load average: 0.00, 0.00, 0.00
web01 | CHANGED | rc=0 >>
 10:56:02 up  1:36,  1 user,  load average: 0.00, 0.00, 0.00

 ```

- Mem free
```bash
web02 | CHANGED | rc=0 >>
               total        used        free      shared  buff/cache   available
Mem:             466         163          21           0         281         281
Swap:              0           0           0
loadbalancer | CHANGED | rc=0 >>
               total        used        free      shared  buff/cache   available
Mem:             466         163          16           0         286         285
Swap:              0           0           0
web01 | CHANGED | rc=0 >>
               total        used        free      shared  buff/cache   available
Mem:             466         164          36           0         265         280
Swap:              0           0           0
db01 | CHANGED | rc=0 >>
               total        used        free      shared  buff/cache   available
Mem:             466         164          26           0         275         284
Swap:              0           0           0
```

- Installing using APIs



- Using service modules
```bash
ansible database -u vagrant -i hosts -m service -a "name=mysql 
state=started"                        

db01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "name": "mysql",
    "state": "started",

ansible database -u vagrant --become -i hosts -m service -a "name=mysql state=restarted" 
db01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "mysql",
    "state": "started",
    "status": {
```


- restarting the webstack
```bash
ansible webstack -u vagrant -i hosts --become -a "reboot--reboot"                                      
web02 | FAILED | rc=-1 >>
Failed to connect to the host via ssh: kex_exchange_identification: Connection closed by remote host
Connection closed by 192.168.1.230 port 22
web01 | FAILED | rc=-1 >>
Failed to connect to the host via ssh: kex_exchange_identification: Connection closed by remote host
Connection closed by 192.168.1.133 port 22
db01 | FAILED | rc=-1 >>
Failed to connect to the host via ssh: System is going down. Unprivileged users are not permitted to log in anymore. For technical details, see pam_nologin(8).

Connection closed by 192.168.1.32 port 22
loadbalancer | FAILED | rc=-1 >>
Failed to connect to the host via ssh: ssh: connect to host loadbalancer port 22: Connection timed out
```

3. Playbooks


- Running playbook1
```bash
ansible-playbook -i hosts Homework/Homework-17/ansible-lab3/playbook1.yml -u vagrant 

PLAY [webservers] *******************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************
ok: [web02]
ok: [web01]

TASK [ensure apache is at the latest version] ***************************************************************************************
ok: [web02]
ok: [web01]

TASK [write the apache2 ports.conf config file] *************************************************************************************
changed: [web02]
changed: [web01]

TASK [write a basic index.html file] ************************************************************************************************
changed: [web02]
changed: [web01]

TASK [ensure apache is running] *****************************************************************************************************
ok: [web02]
ok: [web01]

RUNNING HANDLER [restart apache] ****************************************************************************************************
changed: [web01]
changed: [web02]

PLAY RECAP **************************************************************************************************************************
web01                      : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web02                      : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

- Testing server connectivity
```bash

curl web01:8000

<html>

<h1>Hello Scalefocus Academy! You have reached the web01 server.</h1>

</html>%
```

```bash
curl web01:8000
<html>

<h1>Hello Scalefocus Academy! You have reached the web02 server.</h1>

</html>%
```