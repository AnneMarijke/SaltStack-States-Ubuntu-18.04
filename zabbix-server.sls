install_zabbix:
  pkg.installed:
    - sources:
      - zabbix-release: https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb

zabbix-server-mysql:
  pkg.latest:
    - referesh: true
    - name: zabbix-server-mysql

zabbix-frontend-php:
  pkg.latest:
    - refresg: true
    - name: zabbix-frontend-php

zabbix-agent:
  pkg.latest:
    - refresh: true
    - name: zabbix-agent

zabbix:
  mysql_user.present:
    - host: localhost
    - password: toor

zabbix-database:
  mysql_grants.present:
    - grant: all privileges
    - database: zabbix.*
    - user: zabbix

/etc/zabbix/savvix_server.conf:
  file.append:
    - text: DBPassword=toor

run_zabbix:
  service.running:
    - name: zabbix-server
    - enable: True
