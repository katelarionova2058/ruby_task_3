class Car

  attr_accessor :type,
                :number

  def initialize(number)
    @number = number
    @type   = type
    register_instance
  end

end
