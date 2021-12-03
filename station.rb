require_relative 'instance_counter.rb'

class Station

  include InstanceCounter

  @@all = []

  attr_reader :name, 
              :trains_on_station

  def initialize(name)
    @@all.push(self)
    @name = name  
    @trains_on_station = []
    register_instance
  end

  def add_trains (train)
    @trains_on_station << train
  end

  def del_trains (train)
    trains_on_station.delete(train)
  end

  def show_trains
    @trains_on_station.each { |train| puts train.name }
  end

  def return_type(type)
    count_of_type = @trains_on_station.select { |train| train.type == type }
    count_of_type.count
  end

  def self.all
    @@all
  end

end
