class AddPropertiesToCitation < ActiveRecord::Migration
  def change
    add_column :citations, :submitter_id, :integer
    add_column :citations, :citekey, :string
    add_column :citations, :doi, :string
  end
end
