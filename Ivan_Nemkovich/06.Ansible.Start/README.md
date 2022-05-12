## Output for "ansible -i inventory.yml -m shell -a "cat /etc/hosts" all_workers"
```
debsrv | CHANGED | rc=0 >>
127.0.0.1	localhost
127.0.1.1	debsrv.local.by	debsrv

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ubsrv | CHANGED | rc=0 >>
127.0.0.1 localhost
127.0.1.1 ubsrv

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
## Output for "ansible -i inventory.yml -m apt -a "name=nginx state=latest" --become -K all_workers"
```
ubsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652260589,
    "cache_updated": false,
    "changed": true,
    "stderr": "debconf: delaying package configuration, since apt-utils is not installed\n",
    "stderr_lines": [
        "debconf: delaying package configuration, since apt-utils is not installed"
    ],
    "stdout": "Reading package lists...
    ...
}
debsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652259933,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...
    ...
```
## Output for "ansible -i inventory.yml -m copy -a "src=/home/ivan/ansible/index.nginx-debian.html dest=/var/www/html/" --become -K all_workers"
```
ubsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "3cec08de8194c38fae9347b8f22688ee0ba7fb63",
    "dest": "/var/www/html/index.nginx-debian.html",
    "gid": 0,
    "group": "root",
    "md5sum": "7af14d7b87ebc81ecfa91f9da7b7133b",
    "mode": "0644",
    "owner": "root",
    "size": 380,
    "src": "/home/ivan/.ansible/tmp/ansible-tmp-1652354125.3766263-7524-248608471997354/source",
    "state": "file",
    "uid": 0
}
debsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "3cec08de8194c38fae9347b8f22688ee0ba7fb63",
    "dest": "/var/www/html/index.nginx-debian.html",
    "gid": 0,
    "group": "root",
    "md5sum": "7af14d7b87ebc81ecfa91f9da7b7133b",
    "mode": "0644",
    "owner": "root",
    "size": 380,
    "src": "/home/ivan/.ansible/tmp/ansible-tmp-1652354125.6075032-7526-188679914305245/source",
    "state": "file",
    "uid": 0
}

```

## Output for "ansible -i inventory.yml -m shell -a "systemctl restart nginx" --become -K all_workers"
ubsrv | CHANGED | rc=0 >>

debsrv | CHANGED | rc=0 >>

## Output for "ansible -i inventory.yml -m shell -a "ps -ef | grep nginx" all_workers"
```
ubsrv | CHANGED | rc=0 >>
root        2200       1  0 11:17 ?        00:00:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data    2201    2200  0 11:17 ?        00:00:00 nginx: worker process
ivan        2621    2619  0 12:29 pts/0    00:00:00 /bin/sh -c ps -ef | grep nginx
ivan        2623    2621  0 12:29 pts/0    00:00:00 grep nginx
debsrv | CHANGED | rc=0 >>
root        5083       1  0 14:17 ?        00:00:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data    5084    5083  0 14:17 ?        00:00:00 nginx: worker process
ivan        5387    5385  0 15:29 pts/1    00:00:00 /bin/sh -c ps -ef | grep nginx
ivan        5389    5387  0 15:29 pts/1    00:00:00 grep nginx

```
