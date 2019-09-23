class BookImages < ActiveRecord::Migration[5.2]
  def change
  	drop_table :book_images
  end
end
