class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :follower
end
