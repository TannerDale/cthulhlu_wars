class CreateGameDays < ActiveRecord::Migration[5.2]
  def change
    create_table :game_days do |t|
      t.date :day

      t.timestamps
    end
  end
end
