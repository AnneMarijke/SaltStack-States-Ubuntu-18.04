
base:

  # All minions get the following state files applied
  '*':
    - webserver
    - mysql
    - php
    - syslog-ng
    - docker

  # This machine gets the following state files applied
  'UB-375726-01':
    - syslog-collector
    - zabbix-server

  # All minions which have an ID that begins with the phrase
  # 'minion' will have the following state files applied
  'minion*':
    - zabbix-agent
    - munin-node
    - syslog-client
