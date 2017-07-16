class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :vacuum_id
      t.integer :rental_duration

      t.timestamps
    end
  end
end
