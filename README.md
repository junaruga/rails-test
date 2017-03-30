# rails-tester
A script to check a Rails pacakge depenency and test running the Rails.

## Usage

The script will install Rails to `rails/RAILS_VERSION/`,
and create Rails application (`rails new app`) to `rails/RAILS_VERSION/app`.
RAILS_VERSION is such as "5.0.1", "5.1.0.rc1" in [RubyGems.org rails page](https://rubygems.org/gems/rails).

```bash
$ scripts/run.sh RAILS_VERSION
```

### Not polluting your gem space

You can use the script safely, as it does not pollute your gem package space by below way.

The script is using below commands to install Rails.

```bash
$ bundle install --path vendor/bundle
$ bundle exec rails -v
```

The script is using below commands to create Rails application.

```bash
$ bundle exec rails new app --skip-bundle
$ cd app
$ bundle install --path vendor/bundle
```

### Managed files

I am saving below files on the repository to see the dependency easily.

```
rails/RAILS_VERSION/app/bundle_list.txt
rails/RAILS_VERSION/app/Gemfile
rails/RAILS_VERSION/app/Gemfile.lock
rails/RAILS_VERSION/bundle_list.txt
rails/RAILS_VERSION/Gemfile
rails/RAILS_VERSION/Gemfile.lock
```

## License

MIT

