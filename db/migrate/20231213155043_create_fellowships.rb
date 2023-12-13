class CreateFellowships < ActiveRecord::Migration[7.1]
  def change
    create_table :fellowships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followee, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :fellowships, [:follower_id, :followee_id], unique: true
  end
end
