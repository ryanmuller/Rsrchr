class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.string :bibtex

      t.timestamps
    end
  end
end
