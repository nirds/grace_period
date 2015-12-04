# Grace Period
[![Code Climate](https://codeclimate.com/github/nirds/grace_period/badges/gpa.svg)](https://codeclimate.com/github/nirds/grace_period)

Grace Period helps you manage your technical debt creating a way to raise alerts in your Ruby projects based on parameters you set. It is a specialization of the approach to software contracts taken in [contracts.ruby](https://github.com/egonSchiele/contracts.ruby) that focuses on ease-of-use, clear declarative syntax, and flexibility.

You can think of Grace Period as a tool for placing runtime assertions into your code that let you notify yourself about code that is about to, or already has, expired due to some time constraint. Those assertions can cause notifications from simple warnings to log entries to full-blown exceptions. You retain full control of the mechanism of notification and the logic that identifies assertion conditions.
## Philosophy
Time is a pervasive concern in software development, yet is rarely called out explicitly. That is starting to change.

 We store many time-based fields in our databases, yet we overwrite data in place under the assumption that the data that is current *now* is the most important thing. In reaction to that, we are seeing the emergence of a new crop of immutable data stores that treat time as a first-class concern, never overwrting data and always letting users go back and forth in time interactively, rather than resorting to the manual retrieval of backups.

Similarly in our code there seems to often be the soft tyranny of *now*, the consideration of the current state of things with considerably less regard for the future or the past. We have background jobs that may be time dependent. We have business processes to support that need to embrace the concepts of days, weekdays, weeks, months, quarters and years. Yet we rarely see time used explicitly in defining the fundamental building blocks of our applications, in our functions or methods. Instead, we pepper our code with temporally conditional logic and conflate deployment times with shifts in behavior.

We also focus on the *now* when we need to deliver on a deadline and make compromises in quality or design to meet that deadline, with the intention of going back to fix it later. This incurs technical debt that can be difficult to pay off without payment plans in place. Grace Period helps you create a payment plan when you make the choice to incur technical debt.

Grace Period, as a project, hopes to probe the intersection of executing code and temporality in new and interesting ways. The obvious low-hanging fruit of our efforts in this first phase is to allow users to declare a method as expired, providing a grace period of gentle warning before raising an exception.

If you are interested in discussing future efforts or letting us know how time impacts your codebase, we invite to join our [mailing list]('#').
## Installation

From the command line:

    gem install graceperiod

For use in your Bundler Gemfile:

    gem 'graceperiod'

## Hello World

A Grace Period is a section of code immediately preceding a method declaration. It identifies the expiration datetime and notification mechanism for the method, along with the grace period during which you would like to be warned about the imminent expiration.

Here is the simplest possible Grace Period:

```ruby
# models/thing.rb

has_grace_period my_method.rb
def my_method
...
```

```yaml
  expires_at:         Date.parse("Tue, 10 Aug 2016 01:20:19 -0500 (EDT)")
  severity:           "warning"
  display_message:    "The my_method method in thing.rb needs to be broken out."
  full_description:    >
    The my_method was made at the end of phase2 for this project with not enough time to
    do everything correctly. This very large method needs to be broken up into smaller
    more readable methods. When refactored correctly my_method will include just call a
    series of private methods.
```
The ruby file says that there is a grace_period set for this method. One advantage to having it in the code is that if you are working on my_method anyway in your normal dev work you can check out the debt and see if you can address it before the grace period expires.

The yaml file says that `my_method` will expire on Tuesday, August 10th, 2016, at the time indicated. Grace Period has reasonable defaults for grace period warnings preceding an expiration which can be adjusted via the configuration file, so the `expires_at` value is the only required value.

There are 3 recommended values as well for the yaml file: severity, display message, and full_description.

The severity can determine how much intervention you want from grace_period at expiration and leading up to it.
- description of severity options

The display message is a custom message that is displayed when the grace period expires to alert the devs about the technical debt that must be addressed.

The full description allows the developers who tackle the debt to understand all the important context around the debt and any recommendations to paying off that debt.

Here is that code sample with an immediate expiration, expressed more completely:

```ruby
require 'grace_period'

class Example
  include GracePeriod::Core

  has_grace_period expires_at: Time.now - 1.second
  def my_method
    puts "hello from my_method!"
  end
end

Example.new.my_method
```
...will produce the output:
```
CODE EXPIRATION WARNING: Invoking a method with an expired GracePeriod in example#my_method
```
Again, it is worth mentioning that Grace Period will use its default values unless instructed otherwise, and we strive to be informative but unobtrusive by default, so an expired method will execute with a warning, but you could alter the default behavior in the configuration or you could add additional arguments to specify the response to an encountered expiration, like this:
```ruby
has_grace_period expires_at: (Time.now - 1.second), respond_by: :exception
```
You can find the [complete list of arguments]('#') below. You can accomplish most typical use cases using the built-in parameters, but Grace Period also lets you pass in code blocks for most values, so that you can have maximum flexibility to add whatever logic makes sense for your app to identify and alert about expirations and grace periods. Find out more on our section on [blocks, procs and lambdas]('#').

## Example App

We have created an example app repo to work with the grace_period gem as a way to try out features and check functionality in a more realistic context beyond our test suite. You can find that app [here](https://github.com/nirds/nird_example_app)

## Tutorial

We've put together a [spiffy tutorial]('#') for you, as well.

## Need Help?
If you run into challenges using this gem please file an issue in our [github issue tracker](https://github.com/nirds/grace_period/issues). Be as specific as possible with your circumstance so that we can identify how we can provide better documentation, understand the bug you found, or frame the feature request.

## Getting Involved

In addition to filing issues as described above we also have a process for folks getting involved in contributing to our gem.

To get started in contributing pull requests to improve this gem:

1. Fork this repository
2. Clone the forked repository to your local machine
3. Watch the tests pass by running:

```
bundle install
bundle exec rake
```
4. Make your modifications or improvements.
5. Submit a PR on GitHub.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nirds/grace_period. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## About NIRD


![alt text](https://s3-us-west-2.amazonaws.com/nirdmarketingassets/nird_logo_centered.png "Northwest Independent Ruby Development")

Grace_period is maintained and funded by NIRD LLC. The names and logos of NIRD are trademarks of NIRD LLC.
We are committed to giving back to the open source community. We are [available for hire.](http://www.nird.us/?utm_source=github)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
