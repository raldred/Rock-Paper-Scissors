class GamesController < ApplicationController
  def index; end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(params[:game])
    @game.play
    if @game.complete?
      redirect_to :action => :show, :id => @game.id
    else
      render :new
    end
  end
  
  def show
    @game = Game.find(params[:id])
  end
end