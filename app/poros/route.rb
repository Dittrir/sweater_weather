class Route
  attr_reader :distance, :time

  def initialize(data)
    @distance = data[:distance]
    @time = data[:time]
  end
end
