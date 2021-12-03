class PassTrain < Train

  @trains = {}

  def initialize (name)
    super
    @type = :pass
  end
end

