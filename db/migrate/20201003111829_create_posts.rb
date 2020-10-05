class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :up, default: 0
      t.integer :down, default: 0
      t.float :rate, default: 0.0

      t.timestamps
    end
  end
end
