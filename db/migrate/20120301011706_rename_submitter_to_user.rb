class RenameSubmitterToUser < ActiveRecord::Migration
  def change
    rename_column :citations, :submitter_id, :user_id
  end
end
