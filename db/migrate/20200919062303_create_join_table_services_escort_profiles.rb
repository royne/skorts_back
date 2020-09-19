class CreateJoinTableServicesEscortProfiles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :services, :escort_profiles do |t|
      t.references :services, foreign_key: true
      t.references :escort_profile, foreign_key: true
    end
  end
end
