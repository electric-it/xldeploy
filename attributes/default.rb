# ==================================================
# XL Deploy version to install
# ==================================================
default['xldeploy']['version'] = '4.5.2'

# ==================================================
# Home directory for XL Deploy
# ==================================================
default['xldeploy']['installdir'] = '/opt'
default['xldeploy']['home'] = "#{node['xldeploy']['installdir']}/xl-deploy-#{node['xldeploy']['version']}-server"

# ==================================================
# The user/group to run XL Deploy as
# ==================================================
default['xldeploy']['user'] = 'xldeploy'
default['xldeploy']['group'] = 'xldeploy'

# ==================================================
# Below attributes used to setup-config.txt for input into xldepoy installer
# ==================================================
default['xldeploy']['adminpassword'] = 'password'
default['xldeploy']['repository'] = "#{node['xldeploy']['home']}/repository"
default['xldeploy']['threads'] = '3'
default['xldeploy']['ssl'] = 'false'
default['xldeploy']['csre'] = 'true'
default['xldeploy']['http_bind'] = '0.0.0.0'
default['xldeploy']['http_context_root'] = '/'
default['xldeploy']['threads_max'] = '24'
default['xldeploy']['cstm'] = '0'
default['xldeploy']['hide_internals'] = 'false'
default['xldeploy']['import_packages'] = 'importablePackages'
default['xldeploy']['port'] = '4516'

default['xldeploy']['filename'] = "xl-deploy-#{node['xldeploy']['version']}-server.zip"
default['xldeploy']['username'] = 'supplied by xebialabs'
default['xldeploy']['password'] = 'supplied by xebialabs'
default['xldeploy']['downloadurl'] = "https://dist.xebialabs.com/xl-deploy/4.5.2/#{node['xldeploy']['filename']}"