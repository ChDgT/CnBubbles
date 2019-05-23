class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :comic, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
