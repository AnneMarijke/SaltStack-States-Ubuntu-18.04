munin-node:
  pkg:
    - installed

/etc/munin/munin-node.conf:
  file.managed:
    - contents: |
        allow ^10\.2\.3\.52$

munin-node-conf:
  service.running:
    - name: munin-node
    - restart: True
