# PayuApi

Simple integration with PayU Recurring Payments API

This gem allows you to create, read, update and delete:
  *  Plans
  *  Customers
  *  Credit Cards
  *  Suscriptions

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
payu.plans.get 'planCode'
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

payu.plans.update('planCode',plan)
```

Delete

```ruby
payu.plans.delete('planCode')
```

### Customers

Read

```ruby
payu.customers.get 'customer_id'
```

Create

```ruby
# New customer with full name and email
customer = {"fullName" => "Pedro E. Pérez","email" => "pperez@payulatam.com"}
# New customer with full name
customer = {"fullName" => "Pedro E. Pérez"}
# New customer with email
customer = {"email" => "pperez@payulatam.com"}

payu.customers.create(customer)
```

Create user with credit card
```ruby
customer = { "fullName"=>"Pedro E. Perez", "email" =>"pperez@payulatam.com",
  "creditCards" => [
    {
    "name" =>"Pedro Perez",
    "document" =>"101010123",
    "number" =>"4111111111111111",
    "type" =>"VISA",
    "expMonth" =>1,
    "expYear" =>2018
    }
  ]
}
payu.customers.create(customer)
```

Update

```ruby
customer = { "fullName" => "Pedro Perez" }

payu.customers.update('customer_id',customers)
```

Delete

```ruby
payu.customers.delete('customer_id')
```

### Subscriptions

Read

```ruby
payu.subscriptions.get 'subscription_id'
```

Create

```ruby
# New Subscription with all new items
subscription =  {
                  "quantity" => "1",
                  "installments" => "1",
                  "trialDays" => "15",
                  "customer" => {
                    "fullName" => "Pedro Perez",
                    "email" => "pperez@payulatam.com",
                    "creditCards" => [
                      "name" => "Pedro Perez",
                      "document" => "101010123",
                      "number" => "4242424242424242",
                      "expMonth" => "06",
                      "expYear" => "2018",
                      "type" => "VISA",
                      "address" => {
                        "line1" => "Street 93B",
                        "line2" => "17 25",
                        "line3" => "Office 301",
                        "postalCode" => "00000",
                        "city" => "Bogotá",
                        "state" => "Bogotá D.C.",
                        "country" => "CO",
                        "phone" => "300300300"
                      }
                    ]
                  },
                  "plan" => {
                    "planCode" => "payu-mag-month-trial",
                    "description" => "PayU Magazine Monthly Subscription Plan",
                    "accountId" => "1",
                    "intervalCount" => "1",
                    "interval" => "YEAR",
                    "maxPaymentsAllowed" => "12",
                    "maxPaymentAttempts" => "3",
                    "paymentAttemptsDelay" => "0",
                    "maxPendingPayments" => "1",
                    "trialDays" => "30",
                    "additionalValues" => [
                        "name" => "PLAN_VALUE",
                        "value" => "25000",
                        "currency" => "COP"
                    ]
                  }
                }

# New Subscription with an existing plan and a new customer
subscription = {
                  "quantity" => "1",
                  "installments" => "1",
                  "trialDays" => "15",
                  "customer" => {
                    "fullName" => "Jhon Doe",
                    "email" => "jhondoe@payulatam.com",
                    "creditCards" => [
                      "name" => "Pedro Perez",
                      "document" => "101010123",
                      "number" => "4242424242424242",
                      "expMonth" => "06",
                      "expYear" => "2018",
                      "type" => "VISA",
                      "address" => {
                        "line1" => "Calle 93B",
                        "line2" => "17 25",
                        "line3" => "Oficina 301",
                        "postalCode" => "00000",
                        "city" => "Bogotá",
                        "state" => "Bogotá D.C.",
                        "country" => "CO",
                        "phone" => "300300300"
                      }
                    ]
                  },
                  "plan" => { "planCode" => "sample-plan-code-002" }
                }
# New Subscription with an existent plan and an existing customer
subscription = {
                  "quantity" => "1",
                  "installments" => "1",
                  "trialDays" => "15",
                  "customer" => {
                    "id" => "830lc6dvol5",
                    "creditCards" => [
                      { "token" => "3df60a32-9e34-4391-ab9b-c166aa386341" }
                    ]
                  },
                  "plan" => { "planCode" => "sample-plan-code-002" }
                }

payu.subscriptions.create(subscription)
```

Update

```ruby
subscription = { "creditCardToken"=>"f4cb9f51-dfa8-41b2-bbba-710192a1f8f3" }

payu.subscriptions.update('subscription_id',subscription)
```

Delete

```ruby
payu.subscriptions.delete('subscription_id')
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
