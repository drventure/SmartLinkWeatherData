require 'SmartLinkWeatherData/version'
require 'smart_link_weather_data'
require 'net/http'
require 'uri'
require 'json'

module SmartLinkWeatherDataSiteMixin
  def chance_of_rain
    pops = PrecipProbability.where(postal_code: postal_code, date: Date.parse('2015-03-20')..Date.parse('2015-03-22'))
    if pops.count == 3
      #if we have 3 days of cached data, just get the max and we're done
      max = 0
      pops.each do |pop|
        if pop.pop > max
          max = pop.pop
        end
      end
      return max
    else
      #otherwise, call wunderground, and cache the 3 days, then return the max
      return SmartLinkWeatherData.update_cache(postal_code)
    end
  end

end
