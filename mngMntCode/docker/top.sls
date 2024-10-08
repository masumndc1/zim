base:

 'G@os:debian':
   - debian.top

 'centos':
   - match: nodegroup
   - centos.top

 'docker-master':
   - docker-master.top

 'docker-host':
   - match: nodegroup
   - docker-host.top

 'debian':
   - match: nodegroup
   - debian.top
