require 'smart_link_weather_data_site_mixin'

#Provide a plain old object that the Mixin can be included into
class NonArSite
  include SmartLinkWeatherDataSiteMixin

  attr_accessor :postal_code
end
