service "teamcity-server" do
  supports start: true, stop: true, restart: true
  action :nothing
end

template "sysconfig.server" do
  path "/etc/sysconfig/teamcity-server"
  mode 0755
  variables data_path: node['teamcity']['data_path'],
            pid_file: node['teamcity']['server']['pid_file'],
            path: node['teamcity']['path'],
            user: node['teamcity']['user']
end

template "init.server" do
  path "/etc/init.d/teamcity-server"
  mode 0755
  notifies :enable, "service[teamcity-server]"
  notifies :start, "service[teamcity-server]"
end

template "server.xml" do
  path "#{node['teamcity']['path']}/conf/server.xml"
  notifies :restart, "service[teamcity-server]"
end
