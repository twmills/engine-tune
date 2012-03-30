require 'helper'

class EngineTune::TestEngineTune < Test::Unit::TestCase
  
  def test_calculate
    assert_equal EngineTune::Calculations.new(observations), EngineTune.calculate(observations)
  end
  
end