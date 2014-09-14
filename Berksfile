source "https://supermarket.getchef.com"

metadata

cookbook 'chef-sugar'

cookbook 'postgresql'
cookbook 'database'

cookbook 'monit', git: 'https://github.com/phlipper/chef-monit.git'
cookbook 'java'

group :integration do
  cookbook 'minitest-handler'
end
