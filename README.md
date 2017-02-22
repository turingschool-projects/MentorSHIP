# MentorSHIP
This is the Turing MentorSHIP project. It is written in Rails 5.

![mentorship](https://s3.amazonaws.com/f.cl.ly/items/1o2y3w262I2b0A2G1a3B/Screen%20Shot%202016-07-20%20at%209.11.26%20PM.png?v=d5da8526)

## Installation

* `git clone git@github.com:turingschool-projects/MentorSHIP.git`
* `cd MentorSHIP`
* `bundle exec rake db:create db:migrate db:seed`

## Running / Development

* `rails s`
* Visit your app at [http://localhost:3000](http://localhost:3000).

 ### Travis-CI

  Travis CI is a continuous integration tool that receives a webhook everytime you update a branch to a repo you've told it to
  follow. It deploys your application for each branch you pull request and runs your tests. If either of those things fail
  (deploying or tests) you will see a red X next to your pull request. Clicking the  In order to have it work you must have a
  travis.yml file.

  The following is in our .travis.yml which essentially acts as a travis config and lives in your root directory. 
  For more info go [here](https://docs.travis-ci.com/user/languages/ruby/)

      ```
      language: ruby
      rvm:
        - 2.3.0
      script:
        - bundle exec rake db:setup
        - bundle exec rspec
      cache: bundler
      services:
        - postgresql
      addons:
        postgresql: "9.4"
      ```
      
   ### Heroku

  During development we mostly ran our our app from the development branch on our staging server on heroku. Its available
  [here](https://dashboard.heroku.com/apps/turing-mentorship-staging). 
  The person to bug for ownership is @jbkimble aka kimble-slice.
  
  Our production app is here: https://turing-mentorship.herokuapp.com/
  
  
  The main gotchya's on heroku are making sure to
  
  ```
  #in console
  
  $ rake assets:clobber
  $ rake asssets:precompile 
  # then recommit and push
  ```
  
  The other one is make sure your config variables for heroku are set to the same as your as in your application.yml file. And
  set them the same in Travis.  Otherwise travis will fail, heroku requests to census will break and nothing will work and you
  will cry.
  
  Reach out to me (@vidoseaver) via email if you need anything. Peace.
### Production

* Our deployable app: http://turing-mentorship-api.herokuapp.com/

### Testing

* To run the tests:
* `bundle exec rspec`

### Important notes for seed file
* to populate the seed file with mentors we hit the Census API with a unique access token. This token expires every 90 days. The current token was generated on 02/08/2017. If you are trying to run `rake db:seed` after 05/08/2017 you will need to OAuth in first and get a new access token. We have set up the seed to take an environment variable. We recommend using the figaro gem to help set up the `appication.yml` file.

### Environment variables needed
* In the root of the project is an `application.yml.sample` file. This file contains all environment variables we are using in this project. We didn't push keys (for obvious reasons) but wanted to make sure any future teams knew which variables they needed to use.

###CensusService info
* We are currently taking in info from the mentor dashboard edit and using it to update both our database and Census' database. At this point our database updates correctly and passes the necessary info for Census to the CensusService.new.update_census method. It doesn't make a connection to the census api yet (too late in the mod to accomplish this). You will have to work with Census to make sure this end point `https://census-app-staging.herokuapp.com/api/v1/users/#{id}, params.to_json` is hooked up before you can submit. We have already posted a PR to Census that will tell them the type of data and structure to expect so building it out shouldn't be too much work. 

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
