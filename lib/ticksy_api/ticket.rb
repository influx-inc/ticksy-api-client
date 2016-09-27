module TicksyAPI
  class Ticket < OpenStruct
    def comments
      ticket_comments.map { |key, data| Comment.new data }
    end
  end
end
