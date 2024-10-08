{% set src = '/etc/nagios/objects/localhost.cfg' %}
{% set dst = '/etc/nagios/objects/localhost.cfg.bk' %}
{% if not salt['file.file_exists'](dst) %}
backup:
 file.copy:
  - name: {{ dst }}
  - source: {{ src }}
{% endif %}

/etc/nagios/conf.d/debian95.cfg:
 file.managed:
  - source: salt://nagios/debian95.cfg

/etc/nagios/conf.d/dragonfly.cfg:
 file.managed:
  - source: salt://nagios/dragonfly.cfg

/etc/nagios/conf.d/freebsd.cfg:
 file.managed:
  - source: salt://nagios/freebsdsalt.cfg

/etc/nagios/conf.d/splunk.cfg:
 file.managed:
  - source: salt://nagios/splunk.cfg

/etc/nagios/conf.d/minion.cfg:
 file.managed:
  - source: salt://nagios/minion.cfg

/etc/nagios/nrpe.cfg:
 file.managed:
  - source: salt://nagios/nrpe.cfg
