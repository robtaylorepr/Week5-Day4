class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uname
      t.string :password_digest
      t.string :api_token
      t.string :photo

      t.timestamps
    end
  end
end
