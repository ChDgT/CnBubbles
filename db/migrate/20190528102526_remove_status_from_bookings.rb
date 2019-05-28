class RemoveStatusFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :status, :boolean
  end
end
