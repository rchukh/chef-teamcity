include_recipe 'monit::default'

monit_monitrc 'teamcity-agent' do
  variables pid_file: node['teamcity']['agent']['pid_file']
end
