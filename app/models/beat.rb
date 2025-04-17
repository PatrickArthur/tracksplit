class Beat < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :title, presence: true
end