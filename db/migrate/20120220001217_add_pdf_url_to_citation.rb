class AddPdfUrlToCitation < ActiveRecord::Migration
  def change
    add_column :citations, :pdf_url, :string
  end
end
