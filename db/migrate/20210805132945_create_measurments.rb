# frozen_string_literal: true

class CreateMeasurments < ActiveRecord::Migration[6.1]
  def change
    create_table :measurments do |t|
      t.integer :number
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
