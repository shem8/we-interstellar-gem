# We::Interstellar Gem

[![Build Status](https://travis-ci.com/WeConnect/we-interstellar-gem.svg?token=VdppGkApwpAbNVvz5Ngg&branch=master)](https://travis-ci.com/WeConnect/we-call)

Making calls to Interstellar so you don't have to!

## Goals

- Abstract HTTP interactions behind a simple Ruby interface
- Bridge API changes behind easily deprecateable contracts

## Usage


```ruby
gem 'we-interstellar'
```

```ruby
# Set up the connection, passing app and env if you aren't using Rails
conn = We::Call::Connection.new(host: ENV['INTERSTELLAR_URI'], timeout: 2) do |conn|
  conn.token_auth('intersteller_token')
end

# Instantiate the interstellar client
client = We::Interstellar::Client.new(conn)

# Fetch a list of memberships
memberships = client.get_memberships('<user-uuid>')

puts memberships

# [{
#  product: `physical`
#  started_on: `01-16-2016`
#  ended_on: `09-16-2020`
#  location_uuid: `2f4be4e0-10bb-0135-0f64-38c9860aebd0`
#  account_uuid: `bef0f4f0-10bb-0135-0f64-38c9860aebd0`
#  reservable_uuid: `5a456b40-10bb-0135-0f64-38c9860aebd`
#  reservable_type: `Space`
# }]
```

Read more about contracts in the [Interstellar API Documentation](https://apis.weworkers.io/interstellar.html).


## Requirements

The following Ruby versions are supported.

- 2.2
- 2.3
- 2.4

## Testing

To run tests and modify locally, you'll want to `bundle install` in this directory.

```
bundle exec rspec
```

## Development

If you want to test this gem within an application, update your Gemfile to have something like this: `gem 'we-interstellar-gem', github: 'WeConnect/we-interstellar-gem', branch: 'BRANCHNAME'` and set your local config: `bundle config --local local.we-call path/to/we-interstellar-gem`

Simply revert the Gemfile change (updating the version as necessary!) and remove the config with `bundle config --delete local.we-interstellar-gem`.

References: [Blog Post](https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html) and [Bundle Documentation](https://bundler.io/v1.2/git.html#local)

## Contributing

Bug reports and pull requests are welcome [on GitHub](https://github.com/WeConnect/we-interstellar-gem).
