class CreateJoinTableCategoriesEscortProfiles < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :escort_profiles do |t|
      t.references :category, foreign_key: true
      t.references :escort_profile, foreign_key: true
    end
  end
end
