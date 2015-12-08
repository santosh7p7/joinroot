require 'driver'
require 'trip'

class DrivingHistory
  
  @@drivers = {}   
 
  def self.register_driver(name)
    @@drivers[name] = Driver.new(name)
  end

  def self.drivers
    @@drivers.values
  end

  def self.find_driver(name)
    @@drivers[name] || nil
  end 

  def self.print_report
    drivers.each{|driver| driver.set_profile}
    drivers.sort.each do |driver|
      puts "#{driver.name}: #{driver.total_distance} miles @ #{driver.avg_speed} mph"
    end
  end


  def self.add_trip(trip_info)
    driver = find_driver(trip_info[0])
    if driver
      driver.add_trip Trip.new(trip_info[1], trip_info[2], trip_info[3].to_f)
    end
  end

  def self.import(file)
    File.open(ARGV[0]) do |f|
      f.each_line do |line|
        line.chomp!
        if line.start_with? "Driver"
          DrivingHistory.register_driver(line.split(" ")[1])
        elsif line.start_with? "Trip"
          DrivingHistory.add_trip(line.split(" ")[1..-1])
        else
          puts "Unrecognized line"
        end 
      end
    end
  end

end

