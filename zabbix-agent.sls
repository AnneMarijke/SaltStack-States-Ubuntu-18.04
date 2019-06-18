
install_zabbix:
  pkg.installed:
    - sources:
      - zabbix-release: https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
zabbix-agent:
  pkg.latest:
    - refresh: true
    - name: zabbix-agent

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - contents: |
        Server=10.2.3.52
        ServerActive=10.2.3.52
        Hostname={{ grains['host'] }}
        PidFile=/var/run/zabbix/zabbix_agentd.pid
        LogFile=/var/log/zabbix/zabbix_agentd.log
        BufferSend=5
        BufferSize=600
        MaxLinesPerSecond=600
        Timeout=30
        AllowRoot=1
        Include=/etc/zabbix/zabbix_agentd.d/*.conf
        UnsafeUserParameters=0
        LogFileSize=1
        DebugLevel=3
        StartAgents=8

/var/lib/zabbix/.my.cnf:
  file.managed:
    - contents: |
        [client]
        User = zabbix
        Password = toor

zabbix-agent-conf:
  service.running:
    - name: zabbix-agent
    - restart: true
