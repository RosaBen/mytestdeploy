class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
