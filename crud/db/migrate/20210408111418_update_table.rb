class UpdateTable < ActiveRecord::Migration[6.1]
  def change
  
    add_column :books, :age, :integer
    add_column :books, :email, :string
    rename_column :books, :author, :address
    rename_column :books, :publication_year, :contact_number
  end
end
