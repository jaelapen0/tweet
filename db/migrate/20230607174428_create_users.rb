class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname, presence: true
      t.string :lastname, presence: true
      t.string :username, presence: true
      t.string :email, presence: true
      t.string :session_token, presence: true
      t.string :password_digest, presence: true

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end
