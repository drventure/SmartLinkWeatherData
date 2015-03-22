require 'spec_helper'

describe NonArSite do
  it "should mix in Weather data, and get something for 76034, just as for ActiveRecord model" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pop_for_76034') do
      site = NonArSite.new
      site.postal_code = '76034'
      expect(site.postal_code).to eq('76034')

      expect(site.chance_of_rain).to eq(80)
    end

    expect(PrecipProbability.count).to eq(3)
  end

  it "should be able to get precip probs in batch" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pops_for_batch') do
      site = NonArSite.new
      site.postal_code = '76034'
      sites = []
      sites << site
      site = NonArSite.new
      site.postal_code = '76021'
      sites << site
      site = NonArSite.new
      site.postal_code = '76103'
      sites << site

      SmartLinkWeatherData.update_batch(sites)
    end

    expect(PrecipProbability.count).to eq(9)
  end
end



