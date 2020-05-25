class Plane

  def initialize
    @flying = true
  end

  def land
    raise 'Plane cannot land; plane already landed' unless @flying
    @flying = false
  end

  def take_off
    raise 'Plane cannot take off; plane already flying'
  end

  def airport
    raise 'Plane cannot be at airport; plane already flying'
  end

end
