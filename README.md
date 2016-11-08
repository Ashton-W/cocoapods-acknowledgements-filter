# Cocoapods Acknowledgements Filter

A CocoaPods plugin that filters the pods listed in Acknowledgements

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cocoapods-acknowledgements-filter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cocoapods-acknowledgements-filter

## Example Usage

Add to your `Podfile` and configure, the options are:

- `:exclude` a list of excluded spec names

```ruby
plugin 'cocoapods-acknowledgements-filter', :exclude => ['PrivateKit']
```

- `:filter` a block to filter them yourself
```ruby
plugin 'cocoapods-acknowledgements-filter', :filter => Proc.new { |spec|
  not spec =~ /Private/ 
}
```
