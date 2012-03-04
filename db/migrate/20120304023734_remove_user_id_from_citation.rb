class RemoveUserIdFromCitation < ActiveRecord::Migration
  def up
    remove_column :citations, :user_id
  end

  def down
    change_table :citations do |t|
      t.references :user
    end
  end
end
