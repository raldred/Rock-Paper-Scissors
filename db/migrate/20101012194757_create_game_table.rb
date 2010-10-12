class CreateGameTable < ActiveRecord::Migration
  def self.up
    create_table :games, :force => true do |t|
      t.string :winner
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end