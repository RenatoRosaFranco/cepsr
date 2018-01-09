class CreateEditions < ActiveRecord::Migration[5.1]
  def change
    create_table :editions do |t|
      t.string :name
      t.string :description
      t.string :tags
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
