class CreateUserCitations < ActiveRecord::Migration
  def change
    create_table :user_citations do |t|
      t.references :user
      t.references :citation

      t.timestamps
    end
    add_index :user_citations, :user_id
    add_index :user_citations, :citation_id
  end
end
