class AddrefToRoom < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :product, index: true
  end
end
