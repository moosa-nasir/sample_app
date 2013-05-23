class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :cell_no
      t.string :password
      t.integer :active

      t.timestamps
    end
  end
end
