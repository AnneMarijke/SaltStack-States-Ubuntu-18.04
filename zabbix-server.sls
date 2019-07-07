install_zabbix:
  pkg.installed:
    - sources:
      - zabbix-release: https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb

install-zabbix-server-mysql:
  pkg.installed:
    - name: zabbix-server-mysql

zabbix-frontend-php:
  pkg.installed:
    - name: zabbix-frontend-php

/etc/zabbix/zabbix_server.conf:
  file.append:
    - text: 'DBPassword=toor'

run_zabbix:
  service.running:
    - name: zabbix-server
    - enable: True
