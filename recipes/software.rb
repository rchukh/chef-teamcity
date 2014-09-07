# Install OpenJDK under Ubuntu
if platform?("ubuntu")
  include_recipe "apt::default"

  package 'openjdk-7-jre'
  package 'openjdk-7-jdk'
else
  # Use Java cookbook for under other systems
  include_recipe "java"
end

# Download TeamCity
remote_file "#{node['teamcity']['download_path']}/#{node['teamcity']['file_name']}" do
  source node['teamcity']['download_url']
  action :create_if_missing
  not_if { ::File.exist?(node['teamcity']['install_path']) }
end
