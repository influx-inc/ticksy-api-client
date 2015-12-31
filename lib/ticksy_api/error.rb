module TicksyAPI
  class Error < StandardError
    attr_reader :status # HTTP status
    def initialize(status)
      @status = status
    end
  end
end
