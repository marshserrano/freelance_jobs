class Address < ApplicationRecord
  belongs_to :user
  # validates_numericality_of :zip_code, unless: proc { |f| f.user&.skip_zip_code_validation }
  validates_numericality_of :zip_code, allow_blank: true

  def full_address
    full_address = []
    full_address << barangay unless barangay.blank?
    full_address << city_municipality unless city_municipality.blank?
    full_address << province unless province.blank?
    full_address << zip_code unless zip_code.blank?
    full_address.compact.join(', ').titleize
    # [barangay, city_municipality, province, zip_code].compact.join(', ').titleize
  end
end
