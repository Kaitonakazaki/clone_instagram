class AddUserIdToInstagrams < ActiveRecord::Migration[5.1]
  def change
    add_column :instagrams, :user_id, :integer
  end
end
