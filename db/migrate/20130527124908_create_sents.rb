class CreateSents < ActiveRecord::Migration
  def change
    create_table :sents do |t|
      t.references :user
      t.string :message
      t.string :sent_to
      t.integer :status

      t.timestamps
    end
    add_index :sents, :user_id
  end
end
