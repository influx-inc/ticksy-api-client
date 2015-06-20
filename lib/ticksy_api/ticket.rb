module TicksyAPI
  class Ticket < OpenStruct
    def initialize(data, client)
      super data

      @client = client
    end

    def comments
      @client.ticket_comments ticket_id
    end
  end
end
