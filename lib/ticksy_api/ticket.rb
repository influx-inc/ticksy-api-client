module TicksyAPI
  class Ticket < OpenStruct
    def comments
      Comment.from_hash(ticket_comments) unless ticket_comments.nil?
    end
  end
end
