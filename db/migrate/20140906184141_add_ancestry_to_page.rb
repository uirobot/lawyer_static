class AddAncestryToPage < ActiveRecord::Migration
  def up
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry
  end

  def down
    remove_index :pages, :ancestry
    remove_column :pages, :ancestry
  end
end