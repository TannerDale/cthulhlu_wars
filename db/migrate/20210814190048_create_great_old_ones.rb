class CreateGreatOldOnes < ActiveRecord::Migration[5.2]
  def change
    create_table :great_old_ones do |t|
      t.string :name, null: false
      t.references :faction, foreign_key: true
      t.integer :cost, null: false
      t.string :awaken_steps, null: false
      t.string :combat, null: false
      t.string :ability, null: false

      t.timestamps
    end
  end
end
