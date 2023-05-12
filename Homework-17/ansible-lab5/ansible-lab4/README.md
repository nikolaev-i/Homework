# Ansible Lab 4 - Re-usable playbooks - including and importing

We are going to take the playbook that we are working on and sort of enhance it and make it a lot leaner. We can see that we're getting a lot of code in it and we only have our web servers set up yet. 



1. Move tasks to a tasks subfolder
2. Move handler to handler subfolder
3. Run the playbook

``` shell
ansible-playbook -i hosts -K playbook1.yml
```