class AddPlaceToPages < ActiveRecord::Migration
  def change
    add_column :pages, :place, :integer, :default => 0
  end
end
