require 'SmartLinkWeatherData/version'
require 'net/http'
require 'uri'
require 'json'

module SmartLinkWeatherData
  WU_KEY = '70d670ad87b0564a'

  def self.update_cache(postal_code)
    #we have to get the pops and save
    #NOTE LAT AND LON were mentioned but not specified as possible alternate query args
    #I've left that out for now and only use postal code.
    begin
      raw = get_raw_forecast(postal_code)
      days = raw['forecast']['simpleforecast']['forecastday'].take(3)
      days.each do |d|
        date = Date.new(d['date']['year'], d['date']['month'], d['date']['day'])
        pop = d['pop']
        #TODO May need celcius as well, wasn't specified
        high = d['high']['fahrenheit']
        low = d['low']['fahrenheit']
        qpf = d['qpf_allday']['in']
        PrecipProbability.create(postal_code: postal_code, date: date, pop: pop, qpf: qpf, high: high, low: low)
      end
      #now go ahead and return the chance_of_rain based on the service data
      return get_max_pop(raw)
    rescue StandardError => ex
      #log the error and just return no chance of rain
      #TODO May need to revisit the intention of error handling in this case
      return 0
    end
  end


  def self.get_max_pop(raw_forecast)
    forecast = self.parse_pops(raw_forecast)
    return forecast.max[1]
  end

  def self.get_raw_chance_of_rain(postal_code)
    return get_max_pop(get_raw_forecast(postal_code))
  end

  def self.parse_pops(raw_forecast)
    #parse out probability of precip from the JSON, return as simple hash of date/pop for the next 3 days
    days = raw_forecast['forecast']['simpleforecast']['forecastday'].take(3)
    forecast = {}
    days.each do |d|
      date = Date.new(d['date']['year'], d['date']['month'], d['date']['day'])
      pop = d['pop']
      forecast[date] = pop
    end
    return forecast
  end

  def self.get_raw_forecast(postal_code)
    return '{}' if postal_code.nil?
    url = "http://api.wunderground.com/api/#{WU_KEY}/forecast/q/#{postal_code.to_s}.json"
    uri = URI.parse(url)

    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end
end
