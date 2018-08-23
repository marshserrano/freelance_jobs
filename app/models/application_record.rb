class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def blank_stars
   5 - rating.to_i
  end
end
