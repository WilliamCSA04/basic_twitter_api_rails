class AddLoginTimestamp < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login_datetime, :datetime
  end
end
