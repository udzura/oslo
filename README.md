# Yao

![Logo](./yao-logo.png)

YAO is a Yet Another OpenStack API Wrapper that rocks!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yao'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yao

## Usage

```ruby
require 'yao'

Yao.configure do
  auth_url    "http://keystone.example.local:8080/v2.0"
  tenant_name "fooproject"
  username    "udzura"
  password    "tonk0tsu-r@men"

  # timeout is optional
  timeout     300

  # If your endpoint requires cacert,cert and key
  ca_cert "/path/to/my.ca"
  client_cert "/path/to/my.pem"
  client_key "/path/to/my.key"

  # If you want to change region
  region_name "FukuokaRegion"
end

Yao::Network.list # list up networks...
Yao::Server.list # list up instances...
```

If you want to override some of endpoints by service, you can do:

```ruby
Yao.configure do
  auth_url    "http://endpoint.example.com:12345/v2.0"
  tenant_name "example"
  username    "udzura"
  password    "XXXXXXXX"
  endpoints   identity: { public: "http://override-endpoint.example.com:35357/v3.0" }
end
```

## Support policy

YAO supports rubies which are supported by Ruby Core Team. Please look into [CI](./.github/workflows/ubuntu.yml)'s directive.

If you want to use YAO's full functionality, e.g Ruby 2.3 or below, please create an issue or a PR first (PR Recommended ;) ).

## Pro tips

You can use a prittier namespace:

```ruby
# Instead of require-ing 'yao'
require 'yao/is_openstack_client'

OpenStack.configure do
  auth_url    "http://keystone.example.local:8080/v2.0"
  tenant_name "fooproject"
  username    "udzura"
  password    "tonk0tsu-r@men"
end

OpenStack::Server.list # And let's go on
```

## Contributing

1. Fork it ( https://github.com/yaocloud/yao/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

#### Development

```
$ bundle install

# Run all tests
$ bundle exec rake test

# Speficy the test to run
$ bundle exec rake test TEST=test/yao/resources/
```
