class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :password
      t.string :name
      t.references :branch, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true
      t.boolean :stopped, default: true

      t.timestamps null: false
    end
  end
end
