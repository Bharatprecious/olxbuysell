class AddNameToMessege < ActiveRecord::Migration[7.0]
  def change
    add_column :messeges, :name, :string
  end
end
