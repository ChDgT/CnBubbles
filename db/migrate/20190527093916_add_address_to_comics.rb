class AddAddressToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :address, :string
  end
end
