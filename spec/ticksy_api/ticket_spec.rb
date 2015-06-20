require_relative '../spec_helper'

describe TicksyAPI::Ticket do
  context 'comment' do
    it 'should call the ticket_comments client function' do
      client = double('Client')

      allow(client).to receive(:ticket_comments) { |id| id }

      ticket = TicksyAPI::Ticket.new({ ticket_id: 1 }, client)

      expect(ticket.comments).to eq 1
    end
  end
end
