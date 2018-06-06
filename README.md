$$$ COOKIEBOX

Details coming soon ...


Referencing the 'Make It Rain' VM creation script:  https://raw.githubusercontent.com/ssgeejr/scripts/master/CENTOS7_make_it_rain_UserData
We will need a platform that runs the following (these need to be in the universal bin path):
[[binaries]]
docker
jdk-8u171
apache-maven-3.5.3
python-pip
wget
git
curl
docker-compose
tree

[[Docker Images]]
Artifactory {Pro}
Jenkins
GitBucket
cAdvisor
registry
mongo
tomcat

[[Images that might be useful later on in the demo]]
Nagios
sonarqube
postgres
apache

[[Image Configuration]]
Artifactory
8081
sudo mkdir -p /opt/jfrog/artifactory
sudo chown -R devops:devops /opt/jfrog
docker run --name artifactory-pro --rm -v /opt/jfrog/artifactory:/var/opt/jfrog/artifactory -p 8081:8081 -d docker.bintray.io/jfrog/artifactory-pro:latest
Credentials: admin / twilightzone

Add Group [development, jenkins]
Add Permissions: [devPerms, jenkinsPerms]

Credentials: devops / bigcitylights            w/ development/devPerms
Credentials: release / pointyhairedboss w/ jenkins/jenkinsPerms

Help for Artifactory Users, Groups, Permissions
https://www.jfrog.com/confluence/display/RTF/Managing+Users


Jenkins
8080
mkdir -p /opt/jenkins/home
chown -R 1000:1000 /opt/jenkins
docker run --name jenkins --rm -p 8080:8080 -p 50000:50000 -v /opt/jenkins/home:/var/jenkins_home -d jenkins/jenkins:lts
Credentials: admin / twilightzone


GitBuckekt
8880
mkdir -p /opt/gitbucket/data
chown -R devops:devops /opt/gitbucket
# -p 29418:29418 (only for using ssh)
docker run --name gitbucket --rm -d -p 8880:8080 -p 29418:29418 -v /opt/gitbucket/data:/gitbucket takezoe/gitbucket
Credentials: admin / twilightzone
Credentials: devops / bigcitylights
Credentials: codereviewone / bigcitylights
Credentials: codereviewtwo / bigcitylights


cAdvisor
http://<host>:8180
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8180:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
Credentials: N/A

registry
5100
mkdir -p /opt/docker/registry
chown -R devops:devops /opt/docker
docker run --name=devregistry -d -v /opt/docker/registry:/var/lib/registry:Z -p 5100:5000 registry

Mongo
Jenkin's will start this

Tomcat
Jenkin's will start this