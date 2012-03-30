require 'rubygems'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "engine-tune/calculations"
require "engine-tune/calculator"

#
# An engine's efficiency can be impacted by environmental factors. Supply EngineTune 
# with a hash of the following observations to return a set of calculations:
# temperature (C)
# dew point (C)
# altitude (meters)
# altimeter ()
#
module EngineTune
  
  def self.calculate(observations)
    EngineTune::Calculations.new(observations)
  end
  
end
