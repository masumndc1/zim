nagios:
 service.running:
  - enable: true
  - watch:
    - file: /etc/nagios/*
httpd:
 service.running:
  - enable: true
  - watch:
    - file: /etc/nagios/*
nrpe:
 service.running:
  - enable: true
  - watch:
    - file: /etc/nagios/*
