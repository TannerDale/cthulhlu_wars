class AddDisplayColorToFaction < ActiveRecord::Migration[5.2]
  def change
    add_column :factions, :display_color, :string
  end
end
