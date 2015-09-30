
# XL Deploy Server
	
## XebiaLabs home page and Admin manual
[xebialabs.com](https://xebialabs.com)
 
[docs.xebialabs.com/xl-deploy/4.5.x/systemadminmanual.html](https://docs.xebialabs.com/xl-deploy/4.5.x/systemadminmanual.html)

## Description
XL Deploy is the only application release automation solution that is agentless across all target platforms. Connect to Windows and Unix target systems using proven, industry-standard remote protocols; no agent installation and maintenance, no overhead on the target systems, no firewall ports to be opened, and no security reviews.

## Server requirements
To install the XL Deploy server, the following prerequisites must be met:

1. XL Deploy license: You can download your license from https://tech.xebialabs.com/download/license.
2. Operating system: Windows or Unix-family operating system running Java.
3. Java Runtime Environment: JDK 7 (Oracle, IBM or Apple)
4. RAM: At least 2GB of RAM available for XL Deploy.
5. Hard disk space: Sufficient hard disk space to store the XL Deploy repository. This depends on your usage of XL Deploy. See Determining hard disk space requirements.
	
Depending on the environment, the following may also be required:

1. Database: XL Deploy's Jackrabbit repository supports a number of different databases. For more information, see Configuring the repository.
2. LDAP: To enable group-based security, an LDAP x.509 compliant registry is needed. For more information, see Configuring LDAP security.

## Download Installation Archive
The cookbook is using wget to download the installation archive from xebialabs. 
Set attribute ['xldeploy']['downloadurl'] to this installation archive.
Set attribute default['xldeploy']['username'] = 'supplied by xebialabs' 
Set attribute default['xldeploy']['password'] = 'supplied by xebialabs'

## Using the default recipe the below steps are executed.
1. Creates xldeploy user and group.
2. Creates an installation directory /opt/xl-deploy-4.5.x-server. This can be changed via attributes.
3. wgets the XL Deploy installation archive from the ['xldeploy']['downloadurl'] attribute.
4. Extracts the archive into the installation directory.
5. Change ownership of the installation directory to be owned by xldeploy user and group.
6. Configure the deployit.conf through the setup.config.txt.erb template. All values in this setup file can be overwritten by attributes.
7. Kick off xldeploy installation program (server.sh included in installation archive).
8. Configure xldeploy as a service (runit).

## Post Installation
Add the license file to your installation directory ~/conf directory and restart XLDeploy service

```sv down xldeploy; sv up xldeploy```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License & Authors
- Authors: Robert Castelle & Bernie Durfee

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0
    
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

```
