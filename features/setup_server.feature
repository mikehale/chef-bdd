Feature: Setup my server
As an awesome rails coder
In order to host my rails application
I would like to have chef setup my server

  Background
    Given an ubuntu 9.04 server at slicehost
    And my applications directory is /var/www/apps

  Scenario: Setting up the server
    When I run 'setup_server'
    And the server should have the hostname 'example.com'
    And 'openssh' should be installed configured to 'only allow key logins'
    And the packages 'pgpgpg, mailx, htop, rsync' should be installed
    And 'syslog-ng' should be installed
    And 'git' should be installed
    And 'mysql-server' should be installed configured with 'utf8 and networking disabled'
    And 'apache2' should be installed configured to 'listen on ports '80 and 443 with the modules mod_rails and mod_ssl enabled'
    And 'passenger' version '2.2.2' should be installed configured with 'PassengerUseGlobalQueue=on and PassengerEnabled=off'
    And 'postfix' should be installed
    And the application 'example' from the repository 'git://github.com/mikehale/example-rails.git' and branch 'HEAD' should be running with the 'production' environment at 'https://example.com'
    And 'monit' should be installed configured to monitor 'apache2, mysql-server, postfix, and the application example'