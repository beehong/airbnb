class CreateListings< ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.string :name, index:true
      t.string :property_type, index:true
      t.integer :room_number, index:true
      t.integer :bed_number, index:true
      t.integer :guest_number, index:true
      t.string :country, index:true
      t.string :state, index:true
      t.string :city, index:true
      t.integer :zipcode, index:true
      t.string :address, index:true
      t.integer :price, index:true
      t.string :description, index:true
      t.timestamps 
    end
  end
end