module TicksyAPI
  class Ticket < OpenStruct
    def comments
      ticket_comments.map do |key, data|
        Comment.new(data) unless key == "attachments"
      end.compact
    end
  end
end
