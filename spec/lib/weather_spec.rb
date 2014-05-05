require 'spec_helper'
require 'json'
require_relative '../../weather'
require 'faraday'


describe Weather do

  before {
    response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?q=London,uk")
    json = response.body
    json_data = JSON.parse(json)

    @current_weather = Weather.new(json_data)
    }

  it 'should return the weather for London, Uk' do
    expect(@current_weather.name).to eq('London')
    
  end

end
