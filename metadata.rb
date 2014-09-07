name             'teamcity'
maintainer       'Roman Chukh'
maintainer_email 'roman.chukh@gmail.com'
license          'Apache 2.0'
description      'Installs TeamCity server and agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'

recipe 'default', 'Installs and configures TeamCity server and agent'
recipe 'monit',   'Installs and configures monit to monitor TeamCity'

%w(ubuntu debian centos).each { |os| supports os }
%w(apt postgresql database monit java).each { |cookbook| depends cookbook }
