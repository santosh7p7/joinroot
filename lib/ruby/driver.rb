class Driver
  
  include Comparable

  attr_reader :name, :avg_speed

  def initialize(name)
    @name = name
    @trips = []
  end

  def add_trip(trip)
    @trips << trip
  end

  def total_distance
    @total_distance.round
  end

  def avg_speed
    @avg_speed.round
  end

  def set_profile
    @total_distance = 0
    @avg_speed = 0
    return if @trips.size == 0

    total_avg_speed = 0
    @trips.each do |trip|
      next if trip.avg_speed < 5 or trip.avg_speed > 100
      @total_distance += trip.distance
      total_avg_speed += trip.avg_speed
    end
    @avg_speed = (total_avg_speed/@trips.size)
  end

  def <=>(other)
    other.total_distance <=> self.total_distance
  end
end

