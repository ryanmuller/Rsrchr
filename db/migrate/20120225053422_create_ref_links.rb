class CreateRefLinks < ActiveRecord::Migration
  def change
    create_table :ref_links do |t|
      t.string :url
      t.references :citation
      t.references :user

      t.timestamps
    end
  end
end
