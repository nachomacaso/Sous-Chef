class GroceryMapController < ApplicationController
  def grocery_show
    client = GooglePlaces::Client.new(ENV['google_maps'])
    @locations = client.spots(41.8885, -87.6354, types: ['grocery_or_supermarket'], radius: 1600, openNow: true,)
  end
end
