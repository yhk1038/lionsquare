class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :posting_id
      t.string  :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
