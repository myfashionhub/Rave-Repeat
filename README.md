Rave/Repeat
========

A comprehensive trip planner for EDM festival goers. Users can book flights, hotels, customize their lineup and see which one of their friends are going. [repeatraver.herokuapp.com](Try it now)

![screenshot-raverepeat](https://cloud.githubusercontent.com/assets/7177481/3650169/d85076c8-1119-11e4-9a78-b6272bd1b53e.png)

## Overview
  - Back end: Ruby on Rails, Kayak API, Google Flight & Hotel.
  - Authentication: Omniauth, Omniauth Facebook and Omniauth Twitter
  - Front end: Backbone.js, jQuery/AJAX, Soundcloud Widget API
  - Also jQuery UI, Font Awesome (SASS gem) and SASS


## Dependencies

```ruby
# Gemfile
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'httparty'
gem 'nokogiri'

gem 'backbone-on-rails'
gem 'jquery-ui-rails'
```

## Getting started

* Neccessary env variables in `.bashrc` or `.bash_profile`
```
export RR_TWITTER_KEY=
export RR_TWITTER_SECRET=
export RR_FACEBOOK_ID=
export RR_FACEBOOK_SECRET=
```

* Commands
```
$ bundle install
$ bundle exec rake db:create db:migrate
$ bundle exec rake db:seed  # Seed databases with festival info
$ rails s
```

### RaveRepeat Backbone app

* The application is initialized in `app/assets/javascripts/raveRepeat.js`

* `app/assets/javascripts/flight.js` contains flight search functionality
* `app/assets/javascripts/nav.js`: main menu and navigating through the build trip
