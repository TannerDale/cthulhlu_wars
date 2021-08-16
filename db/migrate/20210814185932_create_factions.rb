class CreateFactions < ActiveRecord::Migration[5.2]
  def change
    create_table :factions do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.string :description, null: false
      t.string :unique_ability, null: false

      t.timestamps
    end
  end
end
