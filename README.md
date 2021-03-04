# Personal Ansible Configs

## How does it work?

1. I uses Ansible pull.

2. Ansible check this Playbook - local.yml and starting it.
	* First of all "tasks to complete before running roles" (update cache etc.)
	* Run roles "base" for all hosts  (default configs, users, etc.)
	* Ryn role "workstation" for machine from hosts file, also run role "server"
	* When the roles have done their job starting "end of run cleanup and reporting" (cleanup package cache, etc.)
	* And after all starting check completion status and send completion alert
		* "send_completion_alert" - send succsess alert in Telegram (you can also add sending to web etc.)
		* "send_failure_alert" - according send failure alert and clear cache (rm -rf \~/.ansible)
		* p.s. telegram chat id and telegram token - group_vars/all (can use sys vars or Vault)

3. Each role has role/tasks main.yml file. It does "include" and "import" all vars and tasks from all dirs
	* Users/{{ user }} - config user home directory
	* Configure desktop environments (mate or gnome using condition)
	* Starting system setup (autofs, scripts, tweaks ...)
	* After doing install software (installing common software for user workstation)


## The folder structure breaks down like this:

**local.yml**: This is the Playbook that Ansible expects to find by default in pull-mode, think of it as an "index" of sorts that pulls other Playbooks in.


**ansible.cfg**: Configuration settings for Ansible goes here.


**group_vars/**: This directory is where I can place variables that will be applied on every system.


**host_vars/**: Each laptop/desktop/server gets a host_vars file in this folder, named after its hostname. Sets variables specific to that computer.


**hosts**: This is the inventory file. Even in pull-mode, an inventory file can be used. This is how Ansible knows what group to put a machine in.


**playbooks**: Additional playbooks that I may want to run, or have triggered.


**roles/**: This directory contains my base, workstation, and server roles. Every host gets the base role. Then either 'workstation' or 'server', depending on what it is.

**roles/base**: This role is for every host, regardles of the type of device it is. This role contains things that are intended to be on every host, such as default configs, users, etc.

**roles/workstation**: After the base role runs on a host, this role runs only on hosts that are designated to be workstations. GUI-specific things, such as GUI apps (Firefox, etc), Flatpaks, wallpaper, etc. Has a folder for the GNOME and MATE desktops.

**roles/server**: After the base role runs on a host, this role runs only on hosts designated as servers. Monitoring plugins, unattended-updates, server firewall rules, and other server-related things are configured here.

After it's run for the first time manually, this Ansible config creates its own Cronjob for itself on that machine so you never have to run it manually again going forward, and it will track all future commits and run them against all your machines as soon as you commit a change. You can find the playbook for Cron in the base role.

## The environment variables requirements:

* ANSIBLE_TELEGRAM_CHAT_ID 
* ANSIBLE_TELEGRAM_TOKEN - for sending jobs status notification

## How do I run it?

It's command pull a playbook from a VCS and execute a default local.yml playbook:

`ansible-pull -U https://github.com/Spehof/personal_ansible_config.git`