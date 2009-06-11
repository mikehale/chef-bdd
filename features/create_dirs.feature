Feature: Create directories
As a packrat
In order to have a place to store things
I would like to have chef create some directories for me

  Background:
    When I run 'dir_stuff'

  Scenario: Creating directories
    Then a directory named '/var/www/apps/my_app' should exist
    And a directory named '/var/www/apps/my_app/corey' should exist
    And a directory named '/var/www/apps/my_app/michael' should exist
      