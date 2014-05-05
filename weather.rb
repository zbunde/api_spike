class Weather
  def initialize(data)
    @data = data
  end
  def name
    @data["name"]
  end
  def city
    @data["city"]["name"]
  end
end