class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :birthday, :time
    add_column :users, :location, :string
  end
end
