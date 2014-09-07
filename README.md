# teamcity cookbook
[![Build Status](https://travis-ci.org/rchukh/chef-teamcity.png)](https://travis-ci.org/rchukh/chef-teamcity)

Downloads, installs and configures [TeamCity](http://www.jetbrains.com/teamcity/). It also installs [PostgreSQL](https://github.com/opscode-cookbooks/postgresql) and uses it as the backend database for TeamCity.

# Platforms
* Debian
* Ubuntu
* Centos

Tested on:

* Ubuntu 13.04

# Recipes
* ```teamcity::default``` - installs PostgreSQL, TeamCity server and agent
* ```teamcity::monit``` - installs monit and configures it to watch server and agent

# Usage
Add ```recipe[teamcity]``` to your runlist. Optionally add ```recipe[teamcity::monit]``` if you'd like TeamCity to be monitored by monit.

# Configuration
You should set at least ```node[:postgresql][:password][:postgres]``` and ```node[:postgresql][:password][:teamcity]``` to avoid unsafe defaults.

* ```node[:teamcity][:version]``` - TeamCity version which will be downloaded (default: 8.1.1)
* ```node[:teamcity][:host]``` - Server hostname (default: localhost)
* ```node[:teamcity][:port]``` - Server port (default: 8111)
* ```node[:teamcity][:user]``` - System username under which TeamCity will be running (default: teamcity)
* ```node[:teamcity][:path]``` - Installation path (default: /usr/local/teamcity)
* ```node[:teamcity][:data_path]``` - Data path (default: /var/teamcity)
* ```node[:teamcity][:agent][:name]``` - Agent's name (default: Default agent)
* ```node[:teamcity][:database][:name]``` - PostgreSQL database name (default: teamcity)
* ```node[:teamcity][:database][:username]``` - PostgreSQL username (default: teamcity)
* ```node[:postgresql][:password][:postgres]``` - PostgreSQL password for 'postgres' user
* ```node[:postgresql][:password][:teamcity]``` - PostgreSQL password for 'teamcity' user

# teamcity_plugin resource

It's possible to download and install custom plugin by utilizing `teamcity_plugin` LWRP:

```ruby
teamcity_plugin 'http://teamcity.jetbrains.com/guestAuth/repository/download/bt398/lastest.lastSuccessful/teamcity.github.zip'
```

It will download and move `teamcity.github.zip` to the `plugins` directory under `node[:teamcity][:data_path]`.

# Testing

Run [test kitchen](https://github.com/opscode/test-kitchen) integration suite:

```bash
bundle exec kitchen test
```

## License and Authors

```text
Copyright 2013-2014, Andrey Chernih(<andrey.chernih@gmail.com>)
Copyright 2014, Roman Chukh (<roman.chukh@gmail.com>)

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
