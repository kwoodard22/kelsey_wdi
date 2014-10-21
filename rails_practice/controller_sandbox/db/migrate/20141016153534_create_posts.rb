class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.string :body
      t.date :published_at
      t.boolean :draft_status

      t.timestamps
    end
  end
end
