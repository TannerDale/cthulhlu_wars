class CreateStrategy < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.references :user, foreign_key: true
      t.references :faction, foreign_key: true
      t.integer :turn
      t.string :description
    end
  end
end
