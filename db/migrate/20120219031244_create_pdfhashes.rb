class CreatePdfhashes < ActiveRecord::Migration
  def change
    create_table :pdfhashes do |t|
      t.integer :citation_id
      t.string :hash

      t.timestamps
    end
  end
end
