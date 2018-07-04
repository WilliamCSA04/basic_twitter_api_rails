class AddLoggedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :logged, :boolean, default: false, null: false
  end
end
