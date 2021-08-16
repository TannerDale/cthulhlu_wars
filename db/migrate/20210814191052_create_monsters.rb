class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.references :faction, foreign_key: true
      t.string :name
      t.integer :cost
      t.string :combat
      t.integer :quantity

      t.timestamps
    end
  end
end
