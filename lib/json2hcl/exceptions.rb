# Exceptions

module Json2hcl
  class InvalidHCLError < StandardError
    def initialize(msg='Invalid HCL')
      super
    end
  end

  class InvalidJSONError < StandardError
    def initialize(msg='Invalid JSON')
      super
    end
  end

  class InvalidFileError < StandardError
    def initialize(msg='Invalid path to file')
      super
    end
  end

  class CommandExecutionError < StandardError
    # TODO: Add extra parameters for stdout, stderr and exitstatus
    def initialize(msg='Command returned a non-zero status')
      super
    end
  end
end
