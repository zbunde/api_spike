require 'spec_helper'
require 'json'
require_relative '../../weather'
require_relative '../../pivitol'
require 'faraday'
require 'dotenv'

Dotenv.load


describe Pivitol do

  it 'should return a list of all your projects' do


    connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects"

    response = connection.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects"
      req.headers['X-TrackerToken'] = ENV['TOKEN']
    end
    json = response.body
    json_data = JSON.parse(json)
    @projects = Pivitol.new(json_data)

    expect(@projects.stories).to include ("Zach's User Authentication")

  end


  it 'should return a list of all your stories for a project' do
    connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects/1060092/stories?"
    response = connection.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/1060092/stories?"
      req.headers['X-TrackerToken'] = ENV['TOKEN']
    end
    json = response.body
     json_data = JSON.parse(json)
     @stories = Pivitol.new(json_data)
    expect(@stories.name).to include "Non administrator users are not allowed to see users list"


  end

  it 'should return a list of details for a story' do
    connection = Faraday.new "https://www.pivotaltracker.com/services/v5/projects/1060092/stories/69484660"
    response = connection.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/1060092/stories/69484660"
      req.headers['X-TrackerToken'] = ENV['TOKEN']
    end
    json = response.body
    json_data = JSON.parse(json)
    @details = Pivitol.new(json_data)
    expect(@details.details).to include ["kind", "story"]


  end
end