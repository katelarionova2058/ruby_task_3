require_relative 'manufacturer.rb'
require_relative 'instance_counter.rb'

class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :name, 
              :type, 
              :num , 
              :num_station , 
              :cars

    def initialize(name)
      @name  = name
      @type  = type
      @cars  = []
      @speed = 0
      
    end

    def stop
      @speed = 0
    end

    def self.find(num)
      @trains[num]
    end


    def set_speed (value)
      @speed += value if value.positive?
    end

    def current_speed
      @speed 
    end

    def add_cars (car)
      @cars.push(car) if @speed.zero? && type = @type
    end

    def del_cars 
      @cars.delete_at(@cars.count - 1) if @speed.zero? 
    end


    def add_route(routes)
      @route = routes
      @current_station = @route.stations.first
      @current_station.add_trains(self)
    end

    def info_of_station_current 
      @current_station
    end

    def next
      self.info_of_station_next
      @current_station.del_trains(self)
      @next_station.add_trains(self)
      @current_station = @next_station
    end

    def back 
      self.info_of_station_back
      @current_station.del_trains(self)
      @back_station.add_trains(self)
      @current_station = @back_station
    end

    private

    def info_of_station_back
      current_index = @route.stations.find_index(@current_station)
      @back_station = @route.stations[current_index -1] if (current_index - 1) >= 0
      @back_station
    end

    def info_of_station_next
      current_index = @route.stations.find_index(@current_station)
      @next_station = @route.stations[current_index +1] if (current_index +1) <= @route.stations.count
      @next_station
    end

   
end 

