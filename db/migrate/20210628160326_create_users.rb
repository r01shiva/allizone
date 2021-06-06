class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :mobile_no
      t.string :password_digest
      t.datetime :deleted_at
      t.string :device_uid
      t.string :app_version

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :mobile_no
    add_index :users, :deleted_at
  end
end
