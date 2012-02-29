class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.references :author
      t.references :citation

      t.timestamps
    end
    add_index :authorships, :author_id
    add_index :authorships, :citation_id
  end
end
