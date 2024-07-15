class CreateUsers < ActiveRecord::Migration[7.1]
  def up
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.boolean :deny, default: false, null: false
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
