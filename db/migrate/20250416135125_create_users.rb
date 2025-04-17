class CreateUsers < ActiveRecord::Migration[7.1] # or your Rails version
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false  # Required for has_secure_password

      t.timestamps
    end
  end
end
