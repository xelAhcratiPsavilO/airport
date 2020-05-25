class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    raise 'Plane cannot land; plane already landed' unless flying
    @flying = false
    @airport = airport
  end

  def take_off
    raise 'Plane cannot take off; plane already flying' if flying
    @flying = true
  end

  def airport
    raise 'Plane cannot be at airport; plane already flying' if flying
    @airport
  end

  private

  attr_reader :flying

end
