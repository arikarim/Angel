class User < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :posts
  has_many :measures
  has_many :measurments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end
