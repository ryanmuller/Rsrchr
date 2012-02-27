class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :user
      t.references :tag
      t.references :citation

      t.timestamps
    end
    add_index :taggings, :user_id
    add_index :taggings, :tag_id
    add_index :taggings, :citation_id
  end
end
