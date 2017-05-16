class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :workouts
  has_many :notes
end
