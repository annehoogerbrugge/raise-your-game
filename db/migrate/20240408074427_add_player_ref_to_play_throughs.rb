class AddPlayerRefToPlayThroughs < ActiveRecord::Migration[7.1]
  def change
    add_reference :play_throughs, :player, null: false, foreign_key: true
  end
end
