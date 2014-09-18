class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.string :name
      t.string :phone
      t.string :email
      t.string :category
      t.text :question
      t.timestamps
    end
  end
end
