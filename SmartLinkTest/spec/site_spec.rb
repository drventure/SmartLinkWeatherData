require 'spec_helper'

describe Site do
  it "should mix in Weather data" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pop_for_76034') do
      site = Site.new
      site.postal_code = '76034'
      expect(site.postal_code).to eq('76034')

      expect(site.chance_of_rain).to eq(80)
    end
  end


  it "should get something for 76034 zip code" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pop_for_76034') do
      site = Site.new
      site.postal_code = '76034'
      expect(site.postal_code).to eq('76034')

      expect(site.chance_of_rain).to eq(80)
    end
  end
end



