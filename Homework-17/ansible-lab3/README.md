# Ansible Lab 3 - Playbooks, Templates and Handlers

In this lab, there is a defined playbook named playbook1.yml that is intended for installing the Apache2 web server.
With this playbook, we will try several scenarios to see how a YAML file is structured in which variables, tasks, and handlers are defined. Jinja templates (web template engine for Python) are used, which we will copy to your web01 and web02, that is, to the group of webservers.

1. ### Exam the playbook and look over the details of the YAML file
    Navigate to ansible-lab3 with the following command:
    ``` shell
    cd /vagrant/ansible-lab3/
    ```
    Read the prepared playbook with:
    ``` shell
    cat playbook1.yml
    ```
    As you can see, there are comments left on the playbook itself explaining all the components and tasks in the playbook.
2. ### Check the Templates
    Two Jinja templates have been added to the playbook1.yml file, which you should look at before running this playbook.
    ``` shell
    cat templates/index.html.j2
    cat templates/ports.conf.j2
    ```
    The index.html.j2 is a simple HTML file with a message defined in the playbook.
    The ports.conf.j2 template is intended as a configuration file for your new Apache servers. That is, it defines the HTTP and HTTPS ports of this service.
3. ### Run the playbook
    Now that we know what the playbook does, it's time to run it. This time we will use the ansible-playbook instead of ansible as before.
    ``` shell
    ansible-playbook -i /home/vagrant/hosts playbook1.yml
    ```
4. ### Test connectivity to servers
    In this situation, it is best to use the curl command to check if your newly installed Apache servers are available and responsive with the templates you added.
    ``` shell
    curl web01:8000
    curl web02:8000
    ```
In summary, this playbook will deploy an Apache web server on a group of hosts and configure it to listen on the specified ports and serve a basic HTML welcome message.