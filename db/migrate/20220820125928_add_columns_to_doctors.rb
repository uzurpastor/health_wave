class AddColumnsToDoctors < ActiveRecord::Migration[7.0]
  def change
    change_table :doctors do |t|
      t.column :category, :string
      t.column :name, :string, null: false, default: ''
    end
    add_index :doctors, :name, unique: true
  end
end
