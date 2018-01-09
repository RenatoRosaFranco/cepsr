class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :description
      t.string :content
      t.string :slug
      t.string :tags
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
