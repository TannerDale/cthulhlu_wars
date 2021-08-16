class CreateCultists < ActiveRecord::Migration[5.2]
  def change
    create_table :cultists do |t|
      t.references :faction, foreign_key: true
      t.string :name, null: false
      t.string :ability, null: false

      t.timestamps
    end
  end
end
