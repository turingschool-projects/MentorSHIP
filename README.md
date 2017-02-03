# MentorSHIP
This is the back end api for the Turing MentorSHIP project. It is written in Rails 5.

![mentorship](https://s3.amazonaws.com/f.cl.ly/items/1o2y3w262I2b0A2G1a3B/Screen%20Shot%202016-07-20%20at%209.11.26%20PM.png?v=d5da8526)

## Installation

* `git clone git@github.com:turingMentorSHIP/MentorSHIP-API.git`
* cd MentorSHIP-API
* `bundle exec rake db:create db:migrate db:seed`

## Running / Development

* `rails s`
* Visit your app at [http://localhost:3000](http://localhost:3000).

### Production

* The Production Version will live here: http://turing-mentorship-api.herokuapp.com/

### Testing

* To run the tests:
* `bundle exec rspec`

## Issues

Github Oauth will be replaced with Census Oauth. To be addressed.


## Endpoints

### Current Schema
![schema](https://s3-us-west-2.amazonaws.com/turingmentorship/Screen+Shot+2017-02-02+at+2.36.02+PM.png)

### Students

#### Get all students with completed profiles

Example Request:
```
  /api/v1/students
```

Example Response - response needs to be updated per specs:
```
{
  "students": [
    {
      "id": 1,
      "avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "student 0",
      "email": "student0@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "student0",
      "bio": "Backend Student Bio",
      "cohort": 1602
      "last_active": "2 days ago"
    },
    {
      "id": 2,
      "avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "student 1",
      "email": "student1@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "student1",
      "bio": "Backend Student Bio",
      "cohort": 1602,
      "last_active": "2 days ago"
    }
  ]
}
```

#### Get a single student by ID

Example Request:
```
  /api/v1/students/1
```

Example Response - also needs to be updated per spec:
```
{
  "student": {
    "id": 1,
    "github":  "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
    "name": "student 0",
    "email": "student0@turing.io",
    "phone_number": "555-555-5555",
    "slack_username": "student0",
    "bio": "Backend Student Bio",
    "cohort": 1602,
    "last_active": "2 days ago"
  }
}
```

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
