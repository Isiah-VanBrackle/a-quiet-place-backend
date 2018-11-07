class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :rating
      t.string :snippet
      t.string :image
      
      t.timestamps
    end
  end
end
