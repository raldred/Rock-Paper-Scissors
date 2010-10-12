class AddHandsToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :players_hand, :string
    add_column :games, :computers_hand, :string
  end

  def self.down
    remove_column :games, :computers_hand
    remove_column :games, :players_hand
  end
end
