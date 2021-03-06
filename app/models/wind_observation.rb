class WindObservation

  attr_reader :station_id, :station_name, :gust, :speed, :direction, :observation_time, :compass_direction, :west_gust_component

  def initialize(station_id, station_name, gust, speed, direction, observation_time)
    wm = WindMath.new(direction)
    @station_id = station_id
    @station_name = station_name
    @gust = gust
    @speed = speed
    @direction = direction
    @observation_time = observation_time
    @compass_direction = wm.compass
    @west_gust_component = wm.west_gust_component(speed)
  end
end

class WindMath
  attr_reader :direction

  def initialize(direction)
    @direction = direction
  end

  def compass
    compass_points[((direction / 22.5) + 0.5).to_i % 16]
  end

  def west_gust_component(speed)
    speed * Math.cos(math_direction_radians)
  end

  private

  def math_direction_radians
    math_direction * Math::PI / 180
  end

  def math_direction
    270.0 - direction
  end

  def compass_points
    ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE',  'SE',  'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
  end

end
