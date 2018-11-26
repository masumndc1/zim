

... this file can be used in saltstack to install nagios.

[root@saltstack base]# pwd
/srv/salt/base
[root@saltstack base]# cat nagios.sls 
ot@saltstack base]# cat epel.sls
InstallEpelRelease:
 pkg.installed:
  - name: epel-release

InstallNagios:
 pkg.installed:
  - name: nagios

