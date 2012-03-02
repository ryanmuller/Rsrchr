class AddMendeleyCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :mendeley_token, :string
    add_column :users, :mendeley_secret, :string
  end
end
