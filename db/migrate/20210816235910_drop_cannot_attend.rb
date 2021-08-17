class DropCannotAttend < ActiveRecord::Migration[5.2]
  def change
    drop_table :cannot_attends
  end
end
