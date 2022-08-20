# frozen_string_literal: true

class CreateReceptions < ActiveRecord::Migration[7.0]
  def change
    create_table :receptions do |t|
      t.integer   :user_id,     null: false
      t.integer   :doctor_id,   null: false
      t.string    :description, null: false
      t.datetime  :time
      t.string    :response
      t.string    :status, null: false
      t.timestamps
    end
  end
end
