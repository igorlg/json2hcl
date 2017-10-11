# Exceptions

module Json2hcl
  class InvalidHCLError < StandardError
    def initialize(msg='Invalid HCL')
      super
    end
  end
end
