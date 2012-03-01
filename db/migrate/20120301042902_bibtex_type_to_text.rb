class BibtexTypeToText < ActiveRecord::Migration
  def up
    change_column :citations, :bibtex, :text
  end

  def down
    change_column :citations, :bibtex, :string
  end
end
