require 'SmartLinkWeatherData/version'
require 'smart_link_weather_data'
require 'net/http'
require 'uri'
require 'json'

module SmartLinkWeatherDataSiteMixin
  def chance_of_rain
    pops = PrecipProbability.where(postal_code: postal_code, date: Date.today..2.days.from_now)
    if pops.count == 3
      max = 0
      pops.each do |pop|
        if pop.pop > max
          max = pop.pop
        end
      end
      return max
    else
      return SmartLinkWeatherData.update_cache(postal_code)
    end
  end

end
