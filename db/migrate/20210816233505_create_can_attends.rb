class CreateCanAttends < ActiveRecord::Migration[5.2]
  def change
    create_table :can_attends do |t|
      t.references :game_day, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
