Feature: Create directories
As a packrat
In order to have a place to store things
I would like to have chef create some directories for me

  @focus
  Scenario: Creating directories
    When I run 'dir_stuff'
    Then a directory named '/var/www/apps/my_app' should exist
    And a directory named '/var/www/apps/my_app/corey' should exist
    And a directory named '/var/www/apps/my_app/michael' should exist
      