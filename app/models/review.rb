class Review < ApplicationRecord
  belongs_to :user
  bdlongs_to :game
end
