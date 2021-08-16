class CHangeActionCostToUse < ActiveRecord::Migration[5.2]
  def change
    remove_column :spellbooks, :action_cost, :integer
    add_column :spellbooks, :action_cost, :string
  end
end
