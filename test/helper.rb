require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'engine-tune'

class Test::Unit::TestCase
  def observations
    { :altitude => 149.0, :temperature => 32.0, :dew_point=>22.0, :altimeter=>1013.4  }
  end

  def round(f, d)
    (f * 10**d).round.to_f / 10**d
  end

  def self.correct_answers
    {
      :vapor_pressure => 26.4295210976309,
      :density_altitude => 876,
      :dyno_correction_factor => 1.0394157966139073,
      :relative_horsepower => 96.2,
      :virtual_temperature => 35.09294483203081,
      :geopotential_altitude => 148.99651429099868,
      :density => 1.1252290472090851,
      :relative_density => 91.85543242523143,
      :altitude => 876.1337602041878,
      :altitude_z => 876.2542996883268,
      :absolute_pressure => 995.6262086849655,
      :relative_humidity => 55.58171762613951
    }
  end
end
