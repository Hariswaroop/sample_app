class AddPasswordToUsers < ActiveRecord::Migration
  ##def change
    #add_column :users, :encrypted_password, :string
    #add_column :users, :, :string
  #end
  def self.up
  add_column :users, :encrypted_password, :string
  end
  def self.down
  remove_coloumn :users, :encrypted_password
  end
end
