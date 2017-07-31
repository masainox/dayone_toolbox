# DayoneToolbox

DayoneToolbox is utility tools for Day One Classic (http://dayoneapp.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dayone_toolbox'
```

And then execute:

	$ bundle

Or install it yourself as:

	$ gem install dayone_toolbox

## Usage

	$ dayone-entry fetch YOUR_ENTRY_FILE --tags --uuid
	{"tags":["tag1"],"uuid":"A5380A52F6134A29B1F6A63921B46378"}

	$ dayone-journal search Journal.dayone --starred
	Journal.dayone/entries/202DCB6A56F74FF7B92DFF47A636E3E0.doentry
	Journal.dayone/entries/38B5B62F6D0841E59A1EDC97C7FCE9BC.doentry
	Journal.dayone/entries/545A5A33FCCA4B4995540E51BF7C74B3.doentry
	Journal.dayone/entries/673B001DE48C4191AF03722B9981A48C.doentry
	Journal.dayone/entries/769A5B14BE314ED98CEDBCBC1099C0D5.doentry
	Journal.dayone/entries/798344CA2A774668AF8190BF16AE4580.doentry
	Journal.dayone/entries/9F89DD5C4C4C40FBA04567FBAC6D9840.doentry
	Journal.dayone/entries/A5380A52F6134A29B1F6A63921B46378.doentry
	Journal.dayone/entries/E2FDA62CF2994F198ADC6A5113E4316F.doentry
	Journal.dayone/entries/F96AD614B8094F12B1948AC3ACD16439.doentry

See also

	$ dayone-entry help
	$ dayone-journal help
		
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masainox/dayone_toolbox.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

