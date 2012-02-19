class CreateScrobbles < ActiveRecord::Migration
  def change
    create_table :scrobbles do |t|
      t.integer :user_id
      t.integer :citation_id
      t.string :hash

      t.timestamps
    end
  end
end
