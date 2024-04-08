class CreatePlayThroughs < ActiveRecord::Migration[7.1]
  def change
    create_table :play_throughs do |t|
      t.belongs_to :player, index: true, foreign_key: true
      t.integer :score
      t.integer :time_spent

      t.timestamps
    end
  end
end
