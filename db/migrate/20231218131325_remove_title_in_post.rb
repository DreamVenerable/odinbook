class RemoveTitleInPost < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :title
  end
end
