# ==================================================
# Java setup
# ==================================================
include_recipe "java::default"

# ==================================================
# XLDeploy user setup
# ==================================================
group "xldeploy" do
  action :create
  group_name node['xldeploy']['group']
end

# ==================================================
# This user will run XL Deploy
# ==================================================
user "xldeploy" do
  action :create
  username  node['xldeploy']['user']
  gid       node['xldeploy']['group']
  comment   "XL Deploy system user"
  home      "/home/xldeploy"
  system    true
  shell     "/bin/false"
end

# ==========================================
# wget installation archive
# ==========================================
execute "wget xldeploy installation archive" do
  command "wget -P #{node['xldeploy']['installdir']} --user=#{node['xldeploy']['username']} --password=#{node['xldeploy']['password']} #{node['xldeploy']['downloadurl']}"
end

# install unzip program
package "unzip" do
  action :install
end

# ==========================================
# xldeploy
# ==========================================
execute "unzip installation archive" do
  command "unzip #{node['xldeploy']['installdir']}/#{node['xldeploy']['filename']} -d #{node['xldeploy']['installdir']}"
end

# ==================================================
# chown install directory
# ==================================================
execute "update ownership" do
  command "chown -R xldeploy:xldeploy #{node['xldeploy']['home']}"
end

# ==================================================
# Create the input file for the installer
# ==================================================
template "setup-config" do
  source  "setup-config.txt.erb"
  path    "#{node['xldeploy']['home']}/setup-config.txt"
  owner   node['xldeploy']['user']
  group   node['xldeploy']['group']
  mode    "0600"
    variables(
    :adminpassword  => node['xldeploy']['adminpassword'],
    :repository  => node['xldeploy']['repository'],
    :threads  => node['xldeploy']['threads'],
    :ssl  => node['xldeploy']['ssl'],
    :csre  => node['xldeploy']['csre'],
    :http_bind  => node['xldeploy']['http_bind'],
    :http_context_root  => node['xldeploy']['http_context_root'],
    :threads_max  => node['xldeploy']['threads_max'],
    :cstm => node['xldeploy']['cstm'],
    :hide_internals => node['xldeploy']['hide_internals'],
    :import_packages => node['xldeploy']['import_packages'],
    :port => node['xldeploy']['port']
    )
  notifies :run, 'execute[install-xldeploy]', :immediately
end

# ==================================================
# Run the installer
# ==================================================
execute "install-xldeploy" do
  user    node['xldeploy']['user']
  group   node['xldeploy']['group']
  cwd     "#{node['xldeploy']['home']}/bin"
  command "./server.sh -setup -reinitialize -force -setup-defaults #{node['xldeploy']['home']}/setup-config.txt &> #{node['xldeploy']['home']}/install.log"
  creates "#{node['xldeploy']['home']}/install.log"
  action :nothing
end

# ==================================================
# Runit configuration
# ==================================================
include_recipe "runit::default"

# ==================================================
# Create the service resource
# ==================================================
runit_service "xldeploy" do
  sv_dir "/etc/sv"
  service_dir "/etc/service"
  owner node['xldeploy']['user']
  group node['xldeploy']['group']
end
directory "/etc/sv/xldeploy/control" do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
template '/etc/sv/xldeploy/control/d' do
  source 'sv-xldeploy-java-down.erb'
  owner 'root'
  group 'root'
  mode '0744'
end
