class AddPendingToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :pending, :boolean, default: true
  end
end
