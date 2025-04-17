class CreateBeats < ActiveRecord::Migration[7.1] # adjust for your Rails version
  def change
    create_table :beats do |t|
      t.string :title, null: false
      t.integer :price, null: false   # price in cents (e.g., 499 = $4.99)
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end