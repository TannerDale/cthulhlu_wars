class RenameActionCostToUse < ActiveRecord::Migration[5.2]
  def change
    rename_column :spellbooks, :action_cost, :use
  end
end
