class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.references :group
      t.references :user
      t.references :citation
      t.text :content

      t.timestamps
    end
    add_index :postings, :group_id
    add_index :postings, :user_id
    add_index :postings, :citation_id
  end
end
