module Spinach

  # Accesses spinach config. Allows you to configure several runtime options,
  # like the step definitions path.
  #
  # @return [Spinach::Config]
  #   the config object
  #
  # @example
  #   Spinach.config[:step_definitions_path]
  #     # => 'features/steps'
  #   Spinach.config[:step_definitions_path] = 'integration/steps'
  #     # => 'integration/steps'
  #
  def self.config
    @config ||= Config.new
  end

  # The config object holds all the runtime configurations needed for spinach
  # to run.
  #
  class Config
    attr_writer :step_definitions_path

    # The "step definitions path" helds the place where your feature classes
    # will be searched for. Defaults to 'features/steps'
    #
    def step_definitions_path
      @step_definitions_path || 'features/steps'
    end

    # Allows you to read the config object using a hash-like syntax.
    #
    # @example
    #   Spinach.config[:step_definitions_path]
    #     # => 'features/steps'
    #
    def [](attribute)
      self.send(attribute)
    end

    # Allows you to set config properties using a hash-like syntax
    #
    # @example
    #   Spinach.config[:step_definitions_path] = 'integration/steps'
    #     # => 'integration/steps'
    #
    def []=(attribute, params)
      self.send("#{attribute}=", params)
    end
  end
end
