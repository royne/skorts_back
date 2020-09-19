class AddPhoneToEscortProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :escort_profiles, :phone, :string
  end
end
