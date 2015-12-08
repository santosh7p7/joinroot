class Trip
  
  attr_reader :start_t, :end_t, :distance, :avg_speed

  def initialize(start_t, end_t, distance)
    @start_t = start_t
    @end_t = end_t
    @distance = distance
    @avg_speed = distance/mindiff(@end_t, @start_t)*60 
  end

  private

  def mindiff(end_t, start_t)
    hour, min = end_t.split(":")
    end_time_min = hour.to_i*60+min.to_i
    hour, min = start_t.split(":")
    start_time_min = hour.to_i*60+min.to_i
    end_time_min - start_time_min 
  end
end

