class CreateUserFactions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_factions do |t|
      t.references :user, foreign_key: true
      t.references :faction, foreign_key: true

      t.timestamps
    end
  end
end
