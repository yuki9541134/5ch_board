class AddTitleIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title_id, :integer
  end
end
