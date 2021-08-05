class Measurment < ApplicationRecord
  belongs_to :user
  belongs_to :measure
  validates :number, presence: true
  validates :date, presence: true
end
