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
end



