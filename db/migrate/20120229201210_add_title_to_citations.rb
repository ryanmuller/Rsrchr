class AddTitleToCitations < ActiveRecord::Migration
  def change
    add_column :citations, :title, :string
  end
end
