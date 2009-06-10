Feature: Setup my server
As an awesome rails coder
In order to host my rails application
I would like to have chef setup my server

  Background:
    When I run 'hale::setup_server'
    Then the run should exit '0'

  Scenario: Creating directories
    Then a directory named 'my_app' should exist
    And a directory named 'my_app/corey' should exist
    And a directory named 'my_app/michael' should exist
      