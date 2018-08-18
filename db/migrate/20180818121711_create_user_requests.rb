class CreateUserRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requests do |t|
      t.references :user, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.string :device_id
      t.integer :helper_type_id
      t.integer :helper_id

      t.timestamps
    end
  end
end
