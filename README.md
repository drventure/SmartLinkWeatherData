# SmartLinkWeatherData

Welcome!

This is a simple gem that enables the use of the WeatherUnderground API to retrieve the max chance of rain over the next three day.
You can mix in the functionallity to any object (ActiveRecord or not) that supports a postal_code property.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'SmartLinkWeatherData'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install SmartLinkWeatherData

You'll also want a SITE model and a PRECIP_PROBABILITY model (used to cache precipitation info locally)

I have not pushed the gem to RubyGems, so you'll need to refer to the gem by path in the Gemfile.

## Usage

Include the gem in your Gemfile, then locate the model you'd like to extend and make it look something like the following example:

```ruby
require 'smart_link_weather_data_site_mixin'
class Site < ActiveRecord::Base
  include SmartLinkWeatherDataSiteMixin
end
```

At that point, your SITE object will now have 'chance_of_rain' method that will return the highest chance of rain for the next 3 days.

# Notes

Please check the SmartLinkTest sub-project nested within this gem for:

1. examples of how to use
2. all of the rspec tests, plus fixtures
3. DB Migrations for creating Site and PrecipProbability tables

In particular, check the non_ar_site_spec file for an example of updating PrecipProbability in batches.


## Development

Nothing at this time.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/SmartLinkWeatherData/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
