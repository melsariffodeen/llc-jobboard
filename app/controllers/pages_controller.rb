class PagesController < ApplicationController
  def home_page

  end

  def style_guide

  end

  def map
    @locations = Location.geocoded

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end
end
