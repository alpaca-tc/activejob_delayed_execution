# active_job_delayed_execution

`active_job_delayed_execution` provides very simple delayed behavior for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activejob'
gem 'active_job_delayed_execution'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_job_delayed_execution

## Usage

```
# config/initializers/activejob_delayed_execution.rb
# Define .delayed method
ActiveRecord::Base.include(ActiveJobDelayedExecution::Delayable)
# ActiveJobDelayedExecution.parent_class_name = 'ApplicationJob'

class User < ActiveRecord::Base
  def very_slow_method; end
  def very_slow_method_with_arguments(a, b, c); end
end

User.first.delayed.very_slow_method #=> Enqueues delayed_job
User.first.delayed.very_slow_method_with_arguments('1', '2', '3') #=> Enqueues delayed_job
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/alpaca-tc/active_job_delayed_execution](https://github.com/alpaca-tc/active_job_delayed_execution). 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
