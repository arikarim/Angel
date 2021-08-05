class Measure < ApplicationRecord
  has_many :measurements
  belongs_to :user
  validates :name, presence: true
  validates :name , uniqueness: true
end
