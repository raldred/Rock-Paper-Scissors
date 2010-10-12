require 'spec_helper'

describe Game do
  
  def valid_attributes
    {
      :winner => 'player',
      :players_hand => 'rock',
      :computers_hand => 'scissors'
    }
  end
  
  before(:each) do
    @game = Game.new
  end
  
  it "should have a winner" do
    @game.should respond_to :winner
    @game.should respond_to :winner=
  end
  
  it "should have a players_hand" do
    @game.should respond_to :players_hand
    @game.should respond_to :players_hand=
  end
  
  it "should have a computers_hand" do
    @game.should respond_to :computers_hand
    @game.should respond_to :computers_hand=
  end
  
  it "should be playable" do
    @game.should respond_to :play
  end
  
  context "given valid args" do
    it "should be valid" do
      @game.update_attributes(valid_attributes)
      @game.should be_valid
    end
  end
  
  it "should be invalid without a players_hand" do
    @game.should_not be_valid
    @game.errors.on(:players_hand).should == "must be one of the following: rock,paper,scissors"
  end
  
  it "should be invalid without a computers_hand" do
    @game.should_not be_valid
    @game.errors.on(:computers_hand).should == "must be one of the following: rock,paper,scissors"
  end
  
  describe "#players_hand" do
    it "should not be valid with an invalid value" do
      @game.players_hand = 'wibble'
      @game.should_not be_valid
    end
  end
  
  describe "#computers_hand" do
    it "should not be valid with an invalid value" do
      @game.computers_hand = 'wibble'
      @game.should_not be_valid
    end
  end
  
  describe "#play" do
    context "when the game has a valid players_hand" do
      before(:each) do
         @game.players_hand = 'rock'
         @game.play
      end
      it "should generate a computers_hand" do
        @game.computers_hand.should =~ /#{Game::HAND_LIST.join('|')}/
      end
      
      it "should set the winner" do
        @game.winner.should =~ /player|computer|draw/
      end
      
      it "should save the game" do
        @game.new_record?.should == false
      end
    end
    
    context "when the game has an invalid players_hand" do
      before(:each) do
        @game.players_hand = 'wibble'
        @game.play
      end
      it "should have an error" do
        @game.should_not be_valid
        @game.errors.on(:players_hand).should == 'must be one of the following: rock,paper,scissors'
      end
      
      it "should not set the winner" do
        @game.winner.should be_nil
      end
      
      it "should not save" do
        @game.new_record?.should == true
      end
    end
  end
  
  describe "#judges_decision" do
    context "when the players hand matches the computers hand" do
      it "should set the winner to 'draw'" do
        @game.players_hand = 'rock'
        @game.computers_hand = 'rock'
        @game.judges_decision
        @game.winner.should == 'draw'
      end
    end
    
    context "when the player has a better hand" do
      it "should set the winner to 'player'" do
        @game.players_hand = 'rock'
        @game.computers_hand = 'scissors'
        @game.judges_decision
        @game.winner.should == 'player'
      end
    end
    
    context "when the computer has a better hand" do
      it "should set the winner to 'computer'" do
        @game.players_hand = 'rock'
        @game.computers_hand = 'paper'
        @game.judges_decision
        @game.winner.should == 'computer'
      end
    end
  end
end
