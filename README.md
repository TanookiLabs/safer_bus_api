# Overview

The Department of Transportation maintains the SaferBusAPI to provide safety information pertaining to transporation companies.  Information related to this API and instructions for access the API can be found here: [https://mobile.fmcsa.dot.gov/developer/apidescription.page?cid=561](https://mobile.fmcsa.dot.gov/developer/apidescription.page?cid=561)


## Installation

Add this line to your application's Gemfile:
```ruby
gem 'safer_bus_api'
```

Then run:
```
bundle install
```

### Configuration

Set your api_token obtained from registering at [https://mobile.fmcsa.dot.gov/developer/UserAccountCreate.page](https://mobile.fmcsa.dot.gov/developer/UserAccountCreate.page)

Note: Once registered you will be emailed a registration token which you can then use to complete your registration and obtain an api token for your application


```ruby
SaferBusApi.configure do |config|
  config.api_token = 'your-token-here'
end
```

## Example Usage

### Query by DOT number:

```ruby
  request = SaferBusApi::Request.new(dot_number: '44110')
  response = request.perform
  response.data # Returns a formatted hash
  response.raw_data # Returns the raw response from 
```

### Query by Company Name:

```ruby
  request = SaferBusApi::Request.new(company_name: 'greyhound') # Note: company name should have no spaces and be all lower case.
  response = request.perform
  response.data # Returns a formatted hash
```

### Query by MC Number:

```ruby
  request = SaferBusApi::Request.new(mc_number: '1515') # Note: company name should have no spaces and be all lower case.
  response = request.perform
  response.data # Returns a formatted hash
```

## Author
[Nathan Bertram](https://github.com/nathanbertram)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure tests are passing with `rspec`
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
7. You da man!