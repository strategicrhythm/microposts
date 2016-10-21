class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :born, :datetime
  end
end
