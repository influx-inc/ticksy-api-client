module TicksyAPI
  class Client
    def initialize(domain, key)
      @domain = domain
      @key = key
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
      execute('ticket-comments', id)['ticket-comments'].map { |data| Comment.new data }
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
