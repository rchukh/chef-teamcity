include_recipe 'monit::default'

monit_monitrc 'teamcity-server' do
  variables pid_file: node['teamcity']['server']['pid_file'],
            host: node['teamcity']['host'],
            port: node['teamcity']['port']
end
