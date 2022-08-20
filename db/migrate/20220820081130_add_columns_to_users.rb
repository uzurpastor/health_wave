class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.column :phone, :string
      t.column :name,  :string
    end
  end
end
