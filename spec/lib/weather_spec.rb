require 'spec_helper'
require 'json'
require_relative '../../weather'
require_relative '../../pivitol'
require 'faraday'


describe Weather do

  it 'should return the weather for London, Uk' do
    VCR.use_cassette("weather") do

      response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?q=London,uk")
      json = response.body
      json_data = JSON.parse(json)

      @current_weather = Weather.new(json_data)
      expect(@current_weather.name).to eq('London')
    end
  end
  it 'should return the 7 day forcast for a city' do
    VCR.use_cassette("forecast") do

      response = Faraday.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=imperial&cnt=7")
      json = response.body
      json_data = JSON.parse(json)
      @current_weather = Weather.new(json_data)
      expect(@current_weather.city).to eq("London")
    end
  end
end
