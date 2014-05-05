class Pivitol
  def initialize(data)
    @data = data

  end
  def stories
    names = []
    @data.each do |name|
     names << name["name"]
    end
    names
  end


  def name
    names = []
    @data.each do |name|
      names << name["name"]
    end
    names
  end

  def details
  details = []
    @data.each do |data|
      details << data
    end
    details
  end
end