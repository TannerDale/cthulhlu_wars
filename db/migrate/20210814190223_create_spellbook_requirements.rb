class CreateSpellbookRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :spellbook_requirements do |t|
      t.references :faction, foreign_key: true
      t.string :description, null: false

      t.timestamps
    end
  end
end
