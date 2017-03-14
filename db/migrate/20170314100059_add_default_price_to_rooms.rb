class AddDefaultPriceToRooms < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :price, :decimal, default:0
  end
end
