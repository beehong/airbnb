class DropImageColumn < ActiveRecord::Migration[5.0]
  def change

  
  	remove_column :users, :image

  	add_column :users, :image, :json
 
    
    
  end
end
