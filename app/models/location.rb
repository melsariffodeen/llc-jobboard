class Location < ActiveRecord::Base
  belongs_to :job_post

  geocoded_by :full_address

  after_validation :geocode

  scope :geocoded, lambda { where("longitude IS NOT NULL AND latitude IS NOT NULL") }

  def full_address
    "#{city} #{country}"
  end

end
