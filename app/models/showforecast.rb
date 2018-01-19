require 'httparty'

class Showforecast

    include HTTParty

    #base_uri "http://api.openweathermap.org/data/2.5/forecast?q=Minsk,BY&mode=jsn&appid=4122e656dc75ed86c90dde6ba95fbcd1"
    base_uri "http://api.openweathermap.org/data/2.5/forecast?q="
    format :json



    # call the  api with HTTParty and parse the JSON response
    def self.call(city,country)
      response = HTTParty.get(base_uri + city + ',' + country + '&mode=jsn&appid=4122e656dc75ed86c90dde6ba95fbcd1&units=metric')
      body = JSON.parse(response.body)
      @list = body["list"]
      return @list
    end



def self.make_hash list, value, keyname1,keyname2,keyname3
  hash = Hash.new
  list.each do |l|
    temp = l["main"][value]

    dtt = l["dt_txt"]
    dt = DateTime.parse(dtt)
    tomorrow = DateTime.tomorrow.at_noon

    if dt == tomorrow
    then
      hash[keyname1] = temp.to_f
    end

    if dt == tomorrow+86400
    then
      hash[keyname2] = temp.to_f
    end

    if dt == tomorrow+172800
    then
      hash[keyname3] = temp.to_f
    end

  end
return hash
end

    def self.make_weathdescr_hash list, value, keyname1,keyname2,keyname3
      hash = Hash.new
      list.each do |l|
        temp = l["weather"][0][value]

        dtt = l["dt_txt"]
        dt = DateTime.parse(dtt)
        tomorrow = DateTime.tomorrow.at_noon

        if dt == tomorrow
        then
          hash[keyname1] = temp.to_s
        end

        if dt == tomorrow+86400
        then
          hash[keyname2] = temp.to_s
        end

        if dt == tomorrow+172800
        then
          hash[keyname3] = temp.to_s
        end

      end
      return hash
    end

    def self.make_clouds_hash list, keyname1,keyname2,keyname3
      hash = Hash.new
      list.each do |l|
        temp = l["clouds"]["all"]

        dtt = l["dt_txt"]
        dt = DateTime.parse(dtt)
        tomorrow = DateTime.tomorrow.at_noon

        if dt == tomorrow
        then
          hash[keyname1] = temp.to_s
        end

        if dt == tomorrow+86400
        then
          hash[keyname2] = temp.to_s
        end

        if dt == tomorrow+172800
        then
          hash[keyname3] = temp.to_s
        end

      end
      return hash
    end

    def self.make_wind_hash list, keyname1,keyname2,keyname3
      hash = Hash.new
      list.each do |l|
        temp = l["wind"]["speed"]

        dtt = l["dt_txt"]
        dt = DateTime.parse(dtt)
        tomorrow = DateTime.tomorrow.at_noon

        if dt == tomorrow
        then
          hash[keyname1] = temp.to_s
        end

        if dt == tomorrow+86400
        then
          hash[keyname2] = temp.to_s
        end

        if dt == tomorrow+172800
        then
          hash[keyname3] = temp.to_s
        end

      end
      return hash
    end

end

