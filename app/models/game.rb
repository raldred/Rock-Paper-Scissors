class Game < ActiveRecord::Base
  
  HAND_LIST = %w( rock paper scissors )
  
  validates_presence_of :winner, :on => :create, :message => "can't be blank"
  validates_inclusion_of :players_hand, :in => HAND_LIST, :message => "players hand must be one of the following: #{HAND_LIST.join(',')}"
  validates_inclusion_of :computers_hand, :in => HAND_LIST, :message => "computers hand must be one of the following: #{HAND_LIST.join(',')}"
end