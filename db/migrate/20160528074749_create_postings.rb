class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      
      t.integer :board_id
      t.string  :title
      t.text    :content
      t.integer :user_id, default: nil

      t.timestamps null: false
    end
  end
end
