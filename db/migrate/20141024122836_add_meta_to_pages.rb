class AddMetaToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title, :string
    add_column :pages, :meta_description, :text
  end
end
