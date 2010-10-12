class GamesController < ApplicationController
  def index; end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(params[:game])
    @game.play
    
  end
end