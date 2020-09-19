class CreateTypeSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :type_subscriptions do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
