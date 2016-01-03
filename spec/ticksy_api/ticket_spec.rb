require_relative '../spec_helper'

describe TicksyAPI::Ticket do

  let(:ticket) {
    TicksyAPI::Ticket.new({ ticket_id: 1, ticket_comments: [{id: 1, body:"Foo"}, {id: 2, body:"Bar"}] })
  }
  context 'comment' do
    it 'should be a Comment object' do
      expect(ticket.comments.first).to be_a(TicksyAPI::Comment)
    end
    it 'should be an alias of ticket_comments' do
      expect(ticket.ticket_comments.count).to eq 2
      expect(ticket.comments.count).to eq 2
    end
  end
end
