class CreateEscortProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :escort_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :profile_photo
      t.integer :city, default: 0
      t.text :description
      t.jsonb :photos, default: []
      t.integer :price
      t.string :schedule
      t.integer :stars
      t.boolean :verified, default: false
      t.integer :sex
      t.integer :age
      t.boolean :subscription, default: false
      t.references :user, foreign_key: true
      t.references :type_subscription, foreign_key: true

      t.timestamps
    end
  end
end
