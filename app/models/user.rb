class User < ApplicationRecord
  has_many :pictures
  has_many :followers
end
