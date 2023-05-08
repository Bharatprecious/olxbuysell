class AddfieldsToMessege < ActiveRecord::Migration[7.0]
  def change
    add_column :messeges, :user_id, :string
    add_column :messeges, :room_id, :string
  end
end
