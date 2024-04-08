class CreatePlayThroughs < ActiveRecord::Migration[7.1]
  def change
    create_table :play_throughs do |t|
      t.integer :score
      t.datetime :time_spent

      t.timestamps
    end
  end
end
