Feature: Example feature to test some basic web automation
  Scenario:  As a user, when I go to guitarcenter.com, I can use their search functionality
    Given someone goes to guitarcenters website
    When they enter a search term of "Electric Piano"
    Then they get results about "Electric Piano"
