class Measure < ApplicationRecord
  has_many :measurments
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
end
