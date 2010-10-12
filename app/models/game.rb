class Game < ActiveRecord::Base
  
  HAND_LIST = %w( rock paper scissors )
  
  validates_inclusion_of :players_hand, :in => HAND_LIST, :message => "Players hand must be one of the following: #{HAND_LIST.join(',')}"
  validates_inclusion_of :computers_hand, :in => HAND_LIST, :message => "Computers hand must be one of the following: #{HAND_LIST.join(',')}"

  before_create :judges_decision

  def play
    set_computers_hand
    save
  end
  
  def judges_decision
    set_winning_move
    self.winner = 'draw' and return if draw?
    self.winner = (player_won?) ? 'player' : 'computer'
  end
  
  private
  
    def draw?
      players_hand == computers_hand
    end
  
    def player_won?
      (players_hand.to_sym == @winning_move)
    end
  
    def set_computers_hand
      hands = HAND_LIST
      self.computers_hand = hands.shuffle.first
    end
    
    def set_winning_move
      winning_moves = {
        :rock => {
          :scissors => :rock,
          :paper => :paper,
          :rock => nil,
        },
        :scissors => {
          :rock => :rock,
          :paper => :scissors,
          :scissors => :nil
        },
        :paper => {
          :rock => :paper,
          :scissors => :scissors,
          :paper => nil
        }
      }
      @winning_move = winning_moves[players_hand.to_sym][computers_hand.to_sym] rescue nil
    end
    
end