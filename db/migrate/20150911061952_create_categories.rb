class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.string :displayed

      t.timestamps null: false
    end
    add_foreign_key(:categories, :users, dependent: :delete)
  end
end
