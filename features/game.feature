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
    Then I should see the followings error: "Players hand must be one of the following: rock,paper,scissors"
    
  Scenario: Selecting a move should display the game result
    When I choose "Rock"
    And I press "Fight!"
    Then I should see the game result
    And I should see my choice
    And I should see the computers choice
    When I press "Play Again"
    Then I should be on the homepage
  
  
