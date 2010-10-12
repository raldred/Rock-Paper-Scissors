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
  
  context "given valid args" do
    it "should be valid" do
      @game.update_attributes(valid_attributes)
      @game.should be_valid
    end
  end
  
  it "should be invalid without a winner" do
    @game.should_not be_valid
    @game.errors.on(:winner).should == "can't be blank"
  end
  
  it "should be invalid without a players_hand" do
    @game.should_not be_valid
    @game.errors.on(:players_hand).should == "players hand must be one of the following: rock,paper,scissors"
  end
  
  it "should be invalid without a computers_hand" do
    @game.should_not be_valid
    @game.errors.on(:computers_hand).should == "computers hand must be one of the following: rock,paper,scissors"
  end
  
  describe "#players_hand" do
    it "should be invalid with a correct value" do
      @game.players_hand = 'wibble'
      @game.should_not be_valid
    end
  end
end
