class Address < ApplicationRecord
  belongs_to :user
  validates :zip_code, numericality: true

  # def full_address
  #   [barangay, city_municipality, province, zip_code].compact.join(', ').titleize
  # end
end
