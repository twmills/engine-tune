module EngineTune
  
  #
  # After getting instantiated with a set of meterological and geological observations, 
  # a Calculations object can determine a number of calculations related to engine
  # efficiency. 
  #
  class Calculations
    
    # Names of observations required for calculations to compute 
    OBSERVATION_ATTRS = [:temperature, :dew_point, :altitude, :altimeter]    
    OBSERVATION_ATTRS.each { |a| attr_accessor a }
    
    attr_writer :metric
    
    #
    # Instantiates a new instance with a hash of observations that must include temperature, 
    # dew_point, altimeter and altitude. These observations are the only required data
    # to calculate all the engine tuning metrics exposed in this object. 
    #
    def initialize(observations)
      observations.each { |method, value| send("#{method}=", value) }
      @metric = true
    end
    
    #
    # Objects are equal if their observations are identical
    #
    def ==(object)
      self.observations == object.observations
    end
    
    #
    # Returns a hash of observations for this set of calculations
    #
    def observations
      OBSERVATION_ATTRS.inject({}) do |result, o| 
        result[o] = send(o)
        result
      end
    end
    
    #
    # Returns true if calculations should be returned using the metric system
    #
    def metric?
      @metric
    end
    
    #
    # Returns true if calculations should be returned using the English system
    #
    def english?
      !@metric
    end    
    
    def vapor_pressure
      @vapor_pressure ||= EngineTune::Calculator.vapor_pressure(dew_point)
      @vapor_pressure_inches ||= EngineTune::Calculator.millibars_to_inches(@vapor_pressure)
      metric? ? @vapor_pressure : @vapor_pressure_inches
    end
    
    def relative_humidity
      @relative_humidity ||= EngineTune::Calculator.relative_humidity(temperature, dew_point)
    end
    
    def absolute_pressure
      @absolute_air_pressure ||= EngineTune::Calculator.absolute_pressure(altimeter, altitude)
      @absolute_air_pressure_inches ||= EngineTune::Calculator.millibars_to_inches(@absolute_air_pressure)
      metric? ? @absolute_air_pressure : @absolute_air_pressure_inches
    end
    
    def density
      @density ||= EngineTune::Calculator.density(altimeter, altitude, dew_point, temperature)
    end
    
    def relative_density
      @relative_density ||= EngineTune::Calculator.relative_density(altimeter, altitude, dew_point, temperature)
    end
    
    def dyno_correction_factor
      @dyno_correction_factor ||= EngineTune::Calculator.dyno_correction_factor(altimeter, altitude, dew_point, temperature)
    end
    
    def virtual_temperature
      @virtual_temperature ||= EngineTune::Calculator.virtual_temperature(altimeter, altitude, dew_point, temperature)
      @virtual_temperature_f ||= EngineTune::Calculator.celsius_to_fahrenheit(@virtual_temperature)
      metric? ? @virtual_temperature : @virtual_temperature_f
    end
    
    def density_altitude
      @density_altitude ||= EngineTune::Calculator.density_altitude(altimeter, altitude, dew_point, temperature)
      @density_altitude_feet ||= EngineTune::Calculator.meters_to_feet(@density_altitude)
      metric? ? @density_altitude : @density_altitude_feet
    end
    
    def relative_horsepower
      @relative_horsepower ||= EngineTune::Calculator.relative_horsepower(altimeter, altitude, dew_point, temperature)
    end
          
  end

end
