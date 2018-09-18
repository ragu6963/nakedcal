class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      
      t.integer :post_id
      t.text :c_content
      t.date :cw_date 

      t.timestamps null: false
    end
  end
end
