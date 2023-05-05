class CreateMesseges < ActiveRecord::Migration[7.0]
  def change
    create_table :messeges do |t|
      t.string :content
      t.timestamps
    end
  end
end
