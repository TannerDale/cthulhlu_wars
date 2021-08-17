class ChangeGameDayToDateTime < ActiveRecord::Migration[5.2]
  def up
    change_table :game_days do |t|
      t.change :day, :date
    end
  end

  def down
    change_table :game_days do |t|
      t.change :day, :datetime
    end
  end
end
