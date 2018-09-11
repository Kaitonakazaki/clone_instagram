class AddImageToInstagram < ActiveRecord::Migration[5.1]
  def change
    add_column :instagrams, :image, :text
  end
end
