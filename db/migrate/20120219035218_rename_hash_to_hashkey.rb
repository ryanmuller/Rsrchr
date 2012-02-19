class RenameHashToHashkey < ActiveRecord::Migration
  def change
    rename_column :pdfhashes, :hash, :hashkey
    rename_column :scrobbles, :hash, :hashkey
  end
end
