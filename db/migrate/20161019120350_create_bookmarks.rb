class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false 
      t.references :micropost, null: false 
      t.timestamps null: false
    end
    
    add_index :bookmarks, :user_id
    add_index :bookmarks, :micropost_id
  end
end
