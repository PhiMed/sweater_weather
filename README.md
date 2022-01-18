Project Description

Sweater Weather (Whether Sweater?) is a Rails application that combines mapping and weather data to allow a user to have a snapshot of the predicted weather at a time and location in the future, in addition to basic core local weather information. The most unique feature is the road-trip function, which allows a registered user to enter origin and destination locations, after which the app will use the estimated travel time (via third-party mapping service) combined with hourly forecast data at the destination location to provide the user weather information for their destination at the time of their arrival. This repo is the back-end API-only portion of the application, to be combined with a theoretical front-end.

API Information

This application uses a PostgresQL database to store User information. It uses the BCrypt gem to hash user passwords so that no password information is stored in the database. Upon registration, an API key is generated on behalf of the user and must be used to make API calls. The API key must be passed as JSON in the body of the request ("api_key": "<key>"), along with the other params.

External data is pulled from Mapquest API, Unsplash API, and OpenWeather API. Keys to these API's are referred to in this repo using environment variables and must be obtained yourself.

This application supports the following API calls:

**Register new user:**

Method: POST
Path: '/api/v1/users'
Params: email, password, password_confirmation
*Params must be passed in body of request as JSON*

ex: {
                "email": "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
                }


**Log in existing user:**

Method: POST
Path: '/api/v1/sessions'
Params: email, password
*Params must be passed in body of request as JSON*

ex: {
                "email": "whatever@example.com",
                "password": "password",
                }

**Get a background image (and metadata) for a location:**

Method: GET
Path: 'api/v1/backgrounds'
Params: location

Ex:

http://localhost:3000/api/v1/backgrounds?location=Denver,CO'

**Get a detailed weather forecast**

Method: GET
Path: 'api/v1/backgrounds'
Params: location

Ex:

http://localhost:3000/api/v1/forecast?location=Denver,CO

**Plan a road trip**

Method: POST
Path: 'api/v1/backgrounds'
Params: location, api_key
*Params must be passed in body of request as JSON*
Ex:

{
                    "origin": "Los Angeles, CA",
                    "destination": "Denver, CO",
                    "api_key": "44b97f3554468cc0e35315ee80b81b0f"
}

Setup
This project was developed via Ruby 2.7.2, on Rails 5.2.6.

To access the dev environment for this app please follow these steps:

Fork this repository
Clone your fork
From the command line, install gems and set up your DB:
bundle
bundle exec figaro install
rails db:{drop,create,migrate,seed}
You can access the test suite (includes use of Capybara, FactoryBot, Faker, RSpec, Shouldamatchers, and Pry) via bundle exec rspec.

Contributors
This project was developed via Ruby on Rails by Philip Medlin. This is an assignment based on material created by faculty at the Turing School of Software and Design.
