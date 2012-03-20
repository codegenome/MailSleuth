# MailSleuth

[![Build Status](https://secure.travis-ci.org/codegenome/MailSleuth.png)](http://travis-ci.org/codegenome/MailSleuth)

This gem provides a model and an observer to log e-mail delivery.

## Installation

Simply add MailSleuth to your Gemfile and bundle it up:

```ruby
gem 'mail_sleuth'
```

Then install the migrations and run them:

```
$ rake mail_sleuth:install:migrations
$ rake db:migrate
```

## Usage

The model is called MessageLog and contains a bunch of attribute named
after Mail::Message accessors. Here's the full list of attributes:

 * `message_id`
 * `bounced?`
 * `final_recipient`
 * `action`
 * `error_status`
 * `diagnostic_code`
 * `retryable?`
 * `from`
 * `to`
 * `delivery_method`
 * `delivery_handler`
 * `errors`
 * `subject`
 * `content_type`
 * `charset`
 * `perform_deliveries`

Some attributes are serialized like: `from`, `to`, `delivery_method`,
`delivery_handler` and `errors`.

## Licence

This project rocks and uses MIT-LICENSE.
