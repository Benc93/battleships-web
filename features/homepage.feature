Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering the first player
    Given I am on the homepage
    When I register to play the game
    Then I should be asked to enter some ships

  Scenario: Placing ships
    Given I have registered
    And I have entered my ships
    Then I should wait for another player to join