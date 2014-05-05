require 'spec_helper'
require 'json'
require_relative '../../weather'
require 'faraday'


describe Weather do

  it 'should return the weather for London, Uk' do
    response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?q=London,uk")
    json = response.body
    json_data = JSON.parse(json)

    @current_weather = Weather.new(json_data)
   expect(@current_weather.name).to eq('London')

  end
  it 'should return the 7 day forcast for a city' do
    response = Faraday.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=7")
    json = response.body
    json_data = JSON.parse(json)
    @current_weather = Weather.new(json_data)
    p @current_weather
    expect(@current_weather.city). to eq("London")
  end


end
