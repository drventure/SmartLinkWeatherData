require 'smart_link_weather_data_site_mixin'

class Site < ActiveRecord::Base
  include SmartLinkWeatherDataSiteMixin
end
