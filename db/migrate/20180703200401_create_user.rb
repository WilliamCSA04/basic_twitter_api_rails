class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, default: "", null: false
      t.string :name, default: "", null: false
      t.string :password, default: "", null: false
    end
  end
end
