/etc/syslog-ng/syslog-ng.conf:
  file.managed:
    - contents: |
        @version: 3.5
        @include "scl.conf"
        @include "`scl-root`/system/tty10.conf"
        source s_local { system(); internal(); };
        destination d_syslog_tcp {
        syslog("10.2.3.52" transport("tcp") port(514)); };
        log { source(s_local);destination(d_syslog_tcp); };
