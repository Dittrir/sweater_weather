# README


## Endpoints

1.a Retrieve Weather For A City

`get /api/v1/forecast?location=denver,co`

![Screen Shot 2022-03-07 at 12 01 34 PM](https://user-images.githubusercontent.com/89048720/157108976-1aa52bd8-3662-4bb5-986a-52b4a558c71e.png)

1.b Background Image For The City

`get /api/v1/backgrounds?location=denver,co`

![Screen Shot 2022-03-07 at 12 04 39 PM](https://user-images.githubusercontent.com/89048720/157109453-d3d3637a-2a5d-4374-81b8-e91acdf2b65e.png)

2. Register A New User

```ruby
new_user = {
                  "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                  }
                  
post "/api/v1/users", params: new_user, as: :json
```

![Screen Shot 2022-03-06 at 12 30 27 PM](https://user-images.githubusercontent.com/89048720/156940960-9005be8f-2a3c-4484-8c5a-17f3420440e1.png)

3. Login A User And Create A New Session

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


4. Create A New Road Trip

```ruby
new_road_trip = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

post "/api/v1/road_trip", params: new_road_trip, as: :json
```

![Screen Shot 2022-03-07 at 12 17 27 PM](https://user-images.githubusercontent.com/89048720/157111271-8fe7ef58-a262-4617-89e9-46ea416e57d9.png) 
