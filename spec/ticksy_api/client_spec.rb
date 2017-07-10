require_relative '../spec_helper'

describe TicksyAPI::Client do
  let(:client) { TicksyAPI::Client.new 'test_domain', 'test_api_key' }

  context 'ticket' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.ticket') do
        expect(client.ticket(123456).ticket_title).to eq 'My Ticket Title'
      end
    end
  end

  context 'my_tickets' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.my_tickets') do
        expect(client.my_tickets[0].ticket_title).to eq 'My Ticket Title'
      end
    end
  end

  context 'open_tickets' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.open_tickets') do
        expect(client.open_tickets[0].ticket_title).to eq 'Open Ticket Title'
      end
    end
  end

  context 'closed_tickets' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.closed_tickets') do
        expect(client.closed_tickets[0].ticket_title).to eq 'Closed Ticket Title'
      end
    end
  end

  context 'my_responses_needed' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.my_responses_needed') do
        expect(client.my_responses_needed).to eq 6
      end
    end
  end

  context 'responses_needed' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.responses_needed') do
        expect(client.responses_needed).to eq 16
      end
    end
  end

  context 'tickets_updated_after' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.tickets_updated_after') do
        expect(client.tickets_updated_after(1499653800)[0].ticket_title).to eq 'Updated Ticket Title'
      end
    end
  end

  context 'ticket_comments' do
    it 'should call the correct api endpoint' do
      VCR.use_cassette('Client.ticket_comments') do
        expect(client.ticket_comments(1)[0].comment).to eq 'Ticket Comment'
      end
    end
  end

  context 'invalid_api_credentials' do
    it 'should raise an error' do
      VCR.use_cassette('Client.error') do
        expect {
          client.my_tickets
        }.to raise_error { |error|
          expect(error).to be_a(TicksyAPI::Error)
          expect(error.status).to eq(400)
          expect(error.message).to eq("Invalid API Credentials")
        }
      end
    end
  end
end
