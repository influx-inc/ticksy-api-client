# Ticksy API Client

A Ruby client for the Ticksy API

# Usage

```ruby
require 'ticksy_api'

client = TicksyAPI::Client.new YOUR_DOMAIN, YOUR_API_KEY

client.open_tickets.each do |ticket|
  ticket.comments.each do |comment|
    puts comment.comment
  end
end
```