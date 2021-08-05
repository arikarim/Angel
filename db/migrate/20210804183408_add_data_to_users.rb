# frozen_string_literal: true

class AddDataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :about, :text
    add_column :users, :image_data, :json
    add_column :users, :availability, :boolean
  end
end
