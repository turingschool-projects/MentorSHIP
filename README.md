# MentorSHIP
This is the Turing MentorSHIP project. It is written in Rails 5.

![mentorship](https://s3.amazonaws.com/f.cl.ly/items/1o2y3w262I2b0A2G1a3B/Screen%20Shot%202016-07-20%20at%209.11.26%20PM.png?v=d5da8526)

## Installation

* `git clone git@github.com:turingMentorSHIP/MentorSHIP.git`
* `cd MentorSHIP-API`
* `bundle exec rake db:create db:migrate db:seed`

## Running / Development

* `rails s`
* Visit your app at [http://localhost:3000](http://localhost:3000).

### Production

* Our deployable app: http://turing-mentorship-api.herokuapp.com/

### Testing

* To run the tests:
* `bundle exec rspec`

### Important notes for seed file
* to populate the seed file with mentors we hit the Census API with a unique access token. This token expires every 90 days. The current token was generated on 02/08/2017. If you are trying to run `rake db:seed` after 05/08/2017 you will need to OAuth in first and get a new access token. We have set up the seed to take an environment variable. We recommend using the figaro gem to help set up the `appication.yml` file.

### Environment variables needed
* In the root of the project is an `application.yml.sample` file. This file contains all environment variables we are using in this project. We didn't push keys (for obvious reasons) but wanted to make sure any future teams knew which variables they needed to use.

## Endpoints

### Current Schema
![schema](http://i.imgur.com/1YoEdXA.png)

### Mentors

#### Get all mentors with completed profiles

Example Request:
```
  /api/v1/mentors
```

Example Response:
```
{
  "mentors": [
    {
      "id": 1,
      "avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "mentor 0",
      "email": "mentor0@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "mentor0",
      "location": "Denver",
      "timezone": "MT",
      "bio": "Former Student, current mentor!",
      "expertise": "Rails, Javascript, Postgres",
      "company": "Turing",
      "position": "Senior Developer",
      "last_active": "2 days ago"
    },
    {
      "id": 2,
      "github_avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "mentor 1",
      "email": "mentor1@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "mentor1",
      "location": "Denver",
      "timezone": "MT",
      "bio": "Former Student, current mentor!"
      "expertise": "Rails, Javascript, Postgres",
      "company": "Turing",
      "position": "Senior Developer",
      "last_active": "2 days ago"
    }
  ]
}
```

#### Get a single mentor by ID

Example Request:
```
  /api/v1/mentors/1
```

Example Response:
```
{
  "mentor": {
    "id": 1,
    "github_avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
    "name": "mentor 0",
    "email": "mentor0@turing.io",
    "phone_number": "555-555-5555",
    "slack_username": "mentor0",
    "location": "Denver",
    "timezone": "MT",
    "bio": "Former Student, current mentor!",
    "expertise": "Rails, Javascript, Postgres",
    "Company": "Turing",
    "Position": "Senior Developer",
    "last_active": "2 days ago"
  }
}
```
