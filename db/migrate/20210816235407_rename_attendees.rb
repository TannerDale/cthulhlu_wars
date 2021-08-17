class RenameAttendees < ActiveRecord::Migration[5.2]
  def change
    rename_table :attendees, :can_attends
  end
end
