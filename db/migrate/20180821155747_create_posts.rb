class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.references :user, foreign_key: true
      
      t.string :date 
      t.text :p_content 
      t.string :w_date 
      t.text :file1
      t.text :file2
      t.text :file3
      t.string :ok 
      t.timestamps null: false
    end
  end
end
