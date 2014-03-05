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

### Plans

Read

```ruby
payu.plans.get 'plan_id'
```

Create

```ruby
plan = {
"planCode" => "sample-plan-code-004",
"description" => "Sample Plan 004",
"accountId" => "xxxxx",
"intervalCount" => "1",
"interval" => "MONTH",
"maxPaymentsAllowed" => "12",
"maxPaymentAttempts" => "3",
"paymentAttemptsDelay" => "1",
"maxPendingPayments" => "0",
"trialDays" => "0",
"additionalValues" => [
    {
      "name" => "PLAN_VALUE",
      "value" => "3000",
      "currency" => "USD"
    }
  ]
}

payu.plans.create(plan)
```

Update

```ruby
plan = { "description" => "New Sample Plan 004" }

payu.plans.update('plan_id',plan)
```

TODO:

1. Missing xml format support
2. Add Additional charges API
3. Add documentation
4. Add tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
