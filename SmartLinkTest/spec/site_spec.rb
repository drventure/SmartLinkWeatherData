require 'spec_helper'

describe Site do
  it "should mix in Weather data" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pop_for_76034') do
      site = Site.new
      site.postal_code = '76034'
      expect(site.postal_code).to eq('76034')

      expect(site.respond_to?(:chance_of_rain)).to be_truthy
    end
  end


  it "should get something for 76034 zip code" do
    #WebMock.allow_net_connect!

    PrecipProbability.delete_all

    VCR.use_cassette('pop_for_76034') do
      site = Site.new
      site.postal_code = '76034'

      expect(site.chance_of_rain).to eq(80)
    end

    expect(PrecipProbability.count).to eq(3)
    expect(PrecipProbability.all[0].qpf).to_not be_nil
    expect(PrecipProbability.all[0].high).to_not be_nil
    expect(PrecipProbability.all[0].low).to_not be_nil
    expect(PrecipProbability.all[0].date).to eq(Date.parse('2015-03-20'))
    expect(PrecipProbability.all[1].date).to eq(Date.parse('2015-03-21'))
    expect(PrecipProbability.all[2].date).to eq(Date.parse('2015-03-22'))

    #first time through, wunderground should have been called
    expect(a_request(:get, /.*api\.wunderground\.com.*/)).to have_been_made.once

    VCR.use_cassette('pop_for_76034') do
      site = Site.new
      site.postal_code = '76034'
      expect(site.chance_of_rain).to eq(80)
    end

    #this time, no call to wunderground should have been made, though
    expect(a_request(:get, /.*api\.wunderground\.com.*/)).to have_been_made.once
  end
end



