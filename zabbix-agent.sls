install_zabbix:
  pkg.installed:
    - sources:
      - zabbix-release: https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zab$
zabbix-agent:
  pkg.latest:
    - refresh: true
    - name: zabbix-agent

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - contents: |
        Server=10.2.3.52
        Hostname={{ grains['host'] }}

zabbix-agent-conf:
  service.running:
    - name: zabbix-agent
    - restart: true
