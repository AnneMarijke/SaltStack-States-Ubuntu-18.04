munin:
  pkg:
    - installed

munin-conf-file:
  file.managed:
    - name: /etc/munin/munin.conf
    - contents: |
        includedir /etc/munin/munin-conf.d
        graph_period second
        [localhost.localdomain]
            address 127.0.0.1
            use_node_name yes
        [minion]
            address 10.2.3.29
            use_node_name yes

munin-conf:
  service.running:
    - name: munin
    - restart: True
