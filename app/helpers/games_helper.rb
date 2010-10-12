module GamesHelper
  def game_winner(game)
    if @game.winner == 'draw'
      haml_tag(:span, "No one won, great minds think alike.", :class => 'draw')
    elsif @game.winner == 'computer'
      haml_tag(:span, 'The computer won, better luck next time.', :class => 'lose')
    elsif @game.winner == 'player'
      haml_tag(:span, 'Your a winner!', :class => 'win')
    end
  end
end