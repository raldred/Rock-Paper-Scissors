Feature: Game
  In order to have lots of fun
  As a gamer
  I want to be able to play a game
  
  Background:
    Given I am on the homepage
    When I press "New Game"
    
  Scenario: New Game
    Then I should see a game form
    And the form should have the following moves:
      | move     |
      | rock     |
      | paper    |
      | scissors |
      
  Scenario: Not selecting a move should return an error
    When I press "Fight!"
    Then I should see an error
