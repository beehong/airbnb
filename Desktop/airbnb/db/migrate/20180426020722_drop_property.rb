class DropProperty < ActiveRecord::Migration[5.0]
  def change
  
  	remove_column :users, :property

  	add_column :users, :image, :string
 
    
     
    end
  

end