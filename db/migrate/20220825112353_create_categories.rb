class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.index :name, unique: true
    end

    remove_column  :doctors, :category, :string
    add_column :doctors, :category_id, :integer, null: false, default: 0
  end
end
