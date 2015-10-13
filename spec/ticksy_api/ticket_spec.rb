require_relative '../spec_helper'

describe TicksyAPI::Ticket do
  context 'comment' do
    it 'should be an alias of ticket_comments' do
      ticket = TicksyAPI::Ticket.new({ ticket_id: 1, ticket_comments: [1,2] })

      expect(ticket.ticket_comments.count).to eq 2
      expect(ticket.comments.count).to eq 2
    end
  end
end
