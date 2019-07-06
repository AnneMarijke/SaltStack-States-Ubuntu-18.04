munin-node:
  pkg:
    - installed

/etc/munin/munin-node.conf:
  file.managed:
    - contents: |
        log_level 4
        log_file /var/log/munin/munin-node.log
        pid_file /var/run/munin/munin-node.pid
        background 1
        setsid 1
        user root
        group root
        ignore_file [\#~]$
        ignore_file DEADJOE$
        ignore_file \.bak$
        ignore_file %$
        ignore_file \.dpkg-(tmp|new|old|dist)$
        ignore_file \.rpm(save|new)$
        ignore_file \.pod$
        host_name localhost.localdomain
        allow ^127\.0\.0\.1$
        allow ^::1$ 
        allow ^10\.2\.3\.52$
        host *
        port 4949

munin-plugins:
  cmd:
    - run
    - name: ln -s /usr/share/munin/plugins/mysql_threads /etc/munin/plugins/

munin-conf:
  service.running:
    - name: munin-node
    - restart: true

