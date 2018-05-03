class AddPropertyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :property, :string
  end
end
