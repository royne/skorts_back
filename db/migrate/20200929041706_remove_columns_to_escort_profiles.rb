class RemoveColumnsToEscortProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :escort_profiles, :profile_photo, :string
    remove_column :escort_profiles, :photos, :jsonb
  end
end
