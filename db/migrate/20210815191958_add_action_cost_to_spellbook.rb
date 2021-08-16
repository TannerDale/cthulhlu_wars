class AddActionCostToSpellbook < ActiveRecord::Migration[5.2]
  def change
    add_column :spellbooks, :action_cost, :integer
  end
end
