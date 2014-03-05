# PayuApi

Simple integration with PayU Recurring Payments API

This gem allows you to create, read, update and delete:
    Plans
    Customers
    Credit cards
    Suscriptions

## Installation

Add this line to your application's Gemfile:

    gem 'payu_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payu_api

## Usage

This gem allows you to integrate with PayU Recurring Payments API. It is designed to work with any ruby framework or plain ruby application.

## Basic Authentication

```ruby
payu = PayuApi::PayU.new 'api_login', 'api_key'
```

TODO:

Missing xml format support
Add Additional charges API
Add documentation
Add tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
