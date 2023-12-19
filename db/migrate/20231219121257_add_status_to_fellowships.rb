class AddStatusToFellowships < ActiveRecord::Migration[7.1]
  def change
    add_column :fellowships, :status, :string, default: 'accepted'
  end
end
