require 'spec_helper'

describe GamesController do
  
  describe "#create" do
  
    context "when the game is complete" do
    
      before(:each) do
        @game = mock_model Game, :complete? => true
        @game.should_receive :play
        Game.should_receive(:new).and_return(@game)
      end
    
      it "should redirect to the game page" do
        post 'create'
        response.should redirect_to(:action => 'show', :id => @game.id)
      end
    end
  
    context "when the game is not complete" do
      before(:each) do
        game = mock_model Game, :complete? => false
        game.should_receive :play
        Game.should_receive(:new).and_return game 
      end
    
      it "should render the new view" do
        post 'create'
        response.should render_template("games/new.html.haml")
      end
    end
  end
end
