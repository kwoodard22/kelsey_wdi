class AddDraftStatusColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :draft_status, :boolean
  end
end
