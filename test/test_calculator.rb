require 'helper'

class EngineTune::TestCalculator < Test::Unit::TestCase
  
  def setup
    observations.each { |k, v| instance_variable_set("@#{k}", v)}
  end
  
  def correct_answers
    Test::Unit::TestCase.correct_answers
  end
  
  def test_vapor_pressure
    value = EngineTune::Calculator.vapor_pressure(@dew_point)    
    assert_equal correct_answers[:vapor_pressure] , round(value, 13)
  end
  
  def test_density_altitude
    value = EngineTune::Calculator.density_altitude(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:density_altitude], value
  end
  
  def test_dyno_correction_factor
    value = EngineTune::Calculator.dyno_correction_factor(@altimeter, @altitude, @dew_point, @temperature)    
    assert_equal correct_answers[:dyno_correction_factor], value
  end
  
  def test_relative_horsepower
    value = EngineTune::Calculator.relative_horsepower(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:relative_horsepower], value
  end
  
  def test_virtual_temperature
    value = EngineTune::Calculator.virtual_temperature(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:virtual_temperature], value
  end
  
  def test_geopotential_altitude
    assert_equal correct_answers[:geopotential_altitude], EngineTune::Calculator.geopotential_altitude(@altitude)
  end
  
  def test_density
    value = EngineTune::Calculator.density(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:density], value
  end
  
  def relative_density
    value = EngineTune::Calculator.relative_density(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:relative_density], value
  end
  
  def test_altitude
    value = EngineTune::Calculator.altitude(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:altitude], value
  end
    
  def test_altitude_z
    value = EngineTune::Calculator.altitude_z(@altimeter, @altitude, @dew_point, @temperature)
    assert_equal correct_answers[:altitude_z], value
  end

  def test_absolute_pressure
    value = EngineTune::Calculator.absolute_pressure(@altimeter, @altitude)
    assert_equal correct_answers[:absolute_pressure], value
  end
    
  def test_relative_humidity
    z = EngineTune::Calculator.relative_humidity(@temperature, @dew_point)
    assert_equal round(correct_answers[:relative_humidity], 13), round(z, 13)
  end
  
  # Measurement conversion tests
  
  def test_inches_to_millibars
    assert_equal 997.96, round(EngineTune::Calculator.inches_to_millibars(29.47), 2)
  end
  
  def test_millibars_to_inches
    assert_equal 29.47, round(EngineTune::Calculator.millibars_to_inches(998), 2)
  end
  
  def test_meters_to_feet
    assert_equal 3458.0052546, EngineTune::Calculator.meters_to_feet(1054)
  end

  def test_round
    number = 21345.56789999
    assert_equal 21345.57, EngineTune::Calculator.round(number, 2)
  end
  
  def test_celsius_to_fahrenheit
    assert_equal 80.6, EngineTune::Calculator.celsius_to_fahrenheit(27)
  end
    
end
