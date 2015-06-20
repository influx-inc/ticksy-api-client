# Ticksy API Client

A Ruby client for the Ticksy API

# Installation

The Ticksy API client can be installed using Rubygems or Bundler.

## Rubygems

```
gem install ticksy_api
```

## Bundler

Add it to your Gemfile

```
gem 'ticksy_api', :git => 'git@github.com:influx-inc/ticksy-api-client.git'
```

# Usage

```ruby
require 'ticksy_api'

client = TicksyAPI::Client.new 'YOUR_DOMAIN', 'YOUR_API_KEY'

client.open_tickets.each do |ticket|
  ticket.comments.each do |comment|
    puts comment.comment
  end
end
```
