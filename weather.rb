class Weather
  def initialize(data)
    @data = data
  end
  def name
    @data["name"]
  end
  def country
    @data["city"]["name"]
  end
end