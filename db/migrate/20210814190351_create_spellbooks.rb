class CreateSpellbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :spellbooks do |t|
      t.references :faction, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
