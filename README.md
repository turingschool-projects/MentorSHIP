# Mentor-ship-backend
This is the back end api for the Turing MentorSHIP project. It is written in Rails 5

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

## Endpoints

### Current Schema
![schema](https://s3.amazonaws.com/mentorship-api/MentorshipSchema.jpg)

### Students

#### Get all students with completed profiles

Example Request:
```
  /api/v1/students
```

Example Response:
```
{
  "students": [
    {
      "id": 1,
      "github_avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "student 0",
      "email": "student0@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "student0",
      "cohort": 1602
    },
    {
      "id": 2,
      "github_avatar": "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
      "name": "student 1",
      "email": "student1@turing.io",
      "phone_number": "555-555-5555",
      "slack_username": "student1",
      "cohort": 1602
    }
  ]
}
```

#### Get a single student by ID

Example Request:
```
  /api/v1/students/1
```

Example Response:
```
{
  "student": {
    "id": 1,
    "github_avatar":  "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460",
    "name": "student 0",
    "email": "student0@turing.io",
    "phone_number": "555-555-5555",
    "slack_username": "student0",
    "cohort": 1602
  }
}
