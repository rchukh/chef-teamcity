# Installing default dependencies
include_recipe "#{cookbook_name}::_dependencies"
# Preparing basic stuff (downloading TeamCity, creating user/group, etc)
include_recipe "#{cookbook_name}::base"
# Using PostgreSQL as default database
include_recipe "#{cookbook_name}::database_pgsql"
# Installing TeamCity server/agent
include_recipe "#{cookbook_name}::nodep_server"
include_recipe "#{cookbook_name}::nodep_agent"
