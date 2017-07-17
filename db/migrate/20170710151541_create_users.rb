class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_admin, default: false
      t.string :password_digest
      t.integer :wallet, default: 500

      t.timestamps
    end
  end
end
