class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :vacuum_id
      t.string :emoji_rating

      t.timestamps
    end
  end
end
