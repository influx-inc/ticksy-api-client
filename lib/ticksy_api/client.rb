module TicksyAPI
  class Client
    def initialize(domain, key)
      @domain = domain
      @key = key
    end

    def ticket(ticket_id)
      Ticket.new execute('ticket', ticket_id)['ticket-data']
    end

    def my_tickets
      execute('my-tickets')['my-tickets'].map { |data| Ticket.new data }
    end

    def open_tickets
      execute('open-tickets')['open-tickets'].map { |data| Ticket.new data }
    end

    def closed_tickets
      execute('closed-tickets')['closed-tickets'].map { |data| Ticket.new data }
    end

    def my_responses_needed
      execute('my-responses-needed')['responses-needed'].to_i
    end

    def responses_needed
      execute('responses-needed')['responses-needed'].to_i
    end

    def ticket_comments(id)
      # For some reason the JSON key here ("ticket_comments") uses an underscore instead of hyphen.
      Comment.from_hash execute('ticket-comments', id)['ticket_comments']
    end

    private

    def execute(endpoint, param = nil)
      response = JSON.parse RestClient.get "https://api.ticksy.com/v1/#{@domain}/#{@key}/#{endpoint}.json/#{param}"

      if response['error']
        raise Error.new(response['code']), response['error']
      end
      response
    end
  end
end
