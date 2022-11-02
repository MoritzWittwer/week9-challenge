class Location < ApplicationRecord
  has_many :activities

  validates :title, :subtitle, presence: true

  has_one_attached :header_image
end
