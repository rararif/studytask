
class WeatherController < ApplicationController

  def index

        @cities = "524901,498817,551487,1486209,491422,1496747,2013348"
        @lookup = Weather.call(@cities)
        @temp = Weather.max_value(Weather.make_hash(@lookup, "temp"))
        @pressure = Weather.max_value(Weather.make_hash(@lookup, "pressure"))
        @humidity = Weather.min_value(Weather.make_hash(@lookup, "humidity"))
        @clouds = Weather.min_value(Weather.cloud_hash(@lookup))
        @best = [@temp,  @humidity, @clouds]
        @recommend = Weather.compare_city(@best)

  end



end
