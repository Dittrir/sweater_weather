# Sweater Weather: Turing 2110 BE Mod 3

[![Dittrir commits](https://badgen.net/github/commits/Naereen/StrapDown.js)](https://GitHub.com/Dittrir/sweater_weather/commits?author=Dittrir)
![languages](https://img.shields.io/github/languages/top/Dittrir/sweater_weather?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

![IMG_5868](https://user-images.githubusercontent.com/89048720/157115569-f0aa1d95-a6c7-4948-9f93-4edff9da022d.jpeg)

## Description
Sweather Weather is an application designed to provide the user with forecast conditions at the location they are visiting, when they plan on arriving. The API can return weather for a location, a background image for that location, create a new user, log that user in and create a new session, input a location that the user is traveling to and return a weather forecast for that location. This app will be a great addition to any upcoming trip!


## Learning Goals 
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Schema
![Screen Shot 2022-03-07 at 12 27 31 PM](https://user-images.githubusercontent.com/89048720/157112673-0a1d4cd2-84a1-4a83-b47d-370fbf28b1bd.png)


The "User" table is the only local database.

## Local Setup
1. Fork and Clone the repo 
```shell
$ git clone git@github.com:Dittrir/sweater_weather.git
```
2.  Navigate to directory 
```shell
$ cd sweater_weather
```
3. Install gem packages:
```shell
$ bundle install
```
4. Update gem packages: 
```shell
$ bundle update
```
5. Set up the schema and migrate data: 
```shell
$ rails db:{create,migrate}
```
6. Install Figaro
```shell
$ bundle exec figaro install
```


## How It Works
This project was designed around tests that were created in [Postman](https://www.postman.com/). These tests ensure functionality over all databases and controller actions and can be viewed in depth by working through the endpoints and parameters listed below.


## Endpoints

1.a Retrieve Weather For A City

`get /api/v1/forecast?location=denver,co`

![Screen Shot 2022-03-07 at 12 01 34 PM](https://user-images.githubusercontent.com/89048720/157108976-1aa52bd8-3662-4bb5-986a-52b4a558c71e.png)

1.b Background Image For The City

`get /api/v1/backgrounds?location=denver,co`

![Screen Shot 2022-03-07 at 12 04 39 PM](https://user-images.githubusercontent.com/89048720/157109453-d3d3637a-2a5d-4374-81b8-e91acdf2b65e.png)

2. Register A New User: Happy Path

```ruby
new_user = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }
                  
post "/api/v1/users", params: new_user, as: :json
```

![Screen Shot 2022-03-06 at 12 30 27 PM](https://user-images.githubusercontent.com/89048720/156940960-9005be8f-2a3c-4484-8c5a-17f3420440e1.png)

2. Register A New User: Sad Path

```ruby
new_user = {
              "password": "password",
              "password_confirmation": "password"
            }
                  
post "/api/v1/users", params: new_user, as: :json
```

![Screen Shot 2022-03-08 at 10 21 31 AM](https://user-images.githubusercontent.com/89048720/157301155-57459806-fd64-4667-bbac-750d81fe05d3.png)


3. Login A User And Create A New Session: Happy Path

```ruby
new_user = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }

post "/api/v1/users", params: new_user, as: :json

new_session = {
                "email": "whatever@example.com",
                "password": "password"
               }

post "/api/v1/sessions", params: new_session, as: :json
 ```

![Screen Shot 2022-03-07 at 12 11 55 PM](https://user-images.githubusercontent.com/89048720/157110559-1c9c5950-93b0-4a6d-8c9a-ec6034a90f03.png)

3. Login A User And Create A New Session: Sad Path

```ruby
new_user = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
            }

post "/api/v1/users", params: new_user, as: :json

new_session = {
                "email": "whatever@example.com",
                "password": "password"
               }

post "/api/v1/sessions", params: new_session, as: :json
 ```
 
![Screen Shot 2022-03-08 at 10 23 30 AM](https://user-images.githubusercontent.com/89048720/157301475-d0e882a6-779b-4d25-a6db-a1183d25b48f.png)

4. Create A New Road Trip: Happy Path

```ruby
new_road_trip = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

post "/api/v1/road_trip", params: new_road_trip, as: :json
```

![Screen Shot 2022-03-07 at 12 17 27 PM](https://user-images.githubusercontent.com/89048720/157111271-8fe7ef58-a262-4617-89e9-46ea416e57d9.png) 

4. Create A New Road Trip: Sad Path

```ruby
new_road_trip = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

post "/api/v1/road_trip", params: new_road_trip, as: :json
```

![Screen Shot 2022-03-08 at 10 26 26 AM](https://user-images.githubusercontent.com/89048720/157301923-39a9a1ff-fcd1-4c81-9720-ad150fb69ed4.png)



## Versions
- Ruby 2.7.2
- Rails 5.2.6

# Gems
- `gem 'pry'`
- `gem 'jsonapi-serializer'`
- `gem 'rspec-rails'`
- `gem 'factory_bot_rails'`
- `gem 'faker', github: 'stympy/faker'`
- `gem 'simplecov', require: false, group: :test`


## Author

<a href="https://github.com/Dittrir/sweater_weather/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Dittrir/sweater_weather" />
</a>

Robin Dittrich
