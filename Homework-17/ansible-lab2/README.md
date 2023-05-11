# Ansible Lab 2 - Ad HOC tasks and Modules

## This lab is intended to introduce ad hoc tasks and modules

An Ansible ad hoc command uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes. ad hoc commands are quick and easy, but they are not reusable. 
So why learn about ad hoc commands? ad hoc commands demonstrate the simplicity and power of Ansible. The concepts you learn here will port over directly to the playbook language.

1. ### Ansible ad hoc command for checking the uptime of the hosts
    In this example, we are going to know the uptime of the hosts. Ansible provides two major modules to run the command over the host group or on the remote server.

    Which one to pick is not a big confusion if you know what are they and their capabilities.
    Here are the commands you can use to get the uptime. All three commands would yield you the same results.

    ``` shell
    ansible all -i /home/vagrant/hosts -m command -a uptime
    ansible all -i /home/vagrant/hosts -m shell -a uptime
    ansible all -i /home/vagrant/hosts -a uptime
    ```
    as you could have already figured out -m is the module and -a should contain the command it should run which goes as an argument to command and shell.

2. ### Check the free memory or memory usage of  hosts using ansible ad hoc command
    The following ansible ad hoc command would help you get the free memory of all the hosts in the host groups.

    As you could see we are running the free -m command on the remote hosts and collecting the information.
    ``` shell
    ansible all -a "free -m" -i /home/vagrant/hosts
    ```

3. ### Update and upgrade all machines
    Now that you're comfortable with a few ad hoc commands, you can move on to updating and upgrading your infrastructure. Because it's always good to be on the latest and greatest versions.
    ``` shell
    ansible all -i /home/vagrant/hosts -m command -a 'sudo apt update'
    ansible all -i /home/vagrant/hosts -m command -a 'sudo apt upgrade -y'
    ```
4. ### Use APT module to install services
    In the next example, we will use the APT module. With it, we will install an Apache web server in the webservers group and a MySQL server in the database group.

    The important thing to note is that the packages will only be installed in the specific group that is specified in the command itself. If all is used, then that command will be executed on all defined machines.
    
    ``` shell
    ansible all -i /home/vagrant/hosts --become -m apt -a "update_cache=yes"
    ansible all -i /home/vagrant/hosts --become -m apt -a "name=swapspace state=present"
    ansible webservers -i /home/vagrant/hosts --become -m apt -a "name=apache2 state=present"
    ansible database -i /home/vagrant/hosts --become -m apt -a "name=mysql-server state=present"
    ```
    For more examples and info you can also look at the official documentation: https://docs.ansible.com/ansible/latest/modules/apt_module.html

5. ### Use service module to manage services
    The service module is quite useful for checking the status, or restarting all services. In the next two examples, you will learn how to check if your MySQL server is active and running and then restart it.
    
    ``` shell
    ansible database -i /home/vagrant/hosts -m service -a "name=mysql state=started"
    ansible database --become -i /home/vagrant/hosts -m service -a "name=mysql state=restarted"
    ```
    You can also check the documentation at: https://docjs.ansible.com/ansible/latest/modules/service_module.html

6. ### Use ansible to reboot webstack
    By executing the following ad hoc command, you will restart the virtual machines from the webstack group.
    ``` shell
    ansible webstack -i /home/vagrant/hosts --become -a "reboot --reboot"
    ```
    It is quite normal to receive a message "Failed to connect to the host via ssh: System is going down" because after executing the command our connection is interrupted because the machine itself is restarted.

These few examples were just an introduction to what can be done with Ansible and ad hoc commands.

Feel free to check out the official documentation for this at: https://docs.ansible.com/ansible/latest/command_guide/intro_adhoc.html
