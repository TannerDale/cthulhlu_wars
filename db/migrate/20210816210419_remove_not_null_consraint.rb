class RemoveNotNullConsraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :game_days, :day, true
  end
end
