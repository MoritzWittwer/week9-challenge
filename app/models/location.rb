class Location < ApplicationRecord
  validates :title, :subtitle, presence: true

  has_one_attached :header_image
end
