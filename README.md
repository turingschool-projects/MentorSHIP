# MentorSHIP
This is the Turing MentorSHIP project. It is written in Rails 5.

![MentorSHIP](http://i.imgur.com/aJ2znTv.jpg)

##Contributers
Add yourself to this list if you helped.

* Mark Miranda (1602)
* Josh Washke (1602)
* Christopher Soden (1603)
* Parker Phillips (1603)
* Megan Talbot (1608)
* John Kimble (1608)
* Vido Seaver (1608)
* Ben Pepper (1608)
* Ryan Spink (1611)
* Daniel Olson (1611)
* Valerie Trundell (1611)
* Ediline Cruz (1611)
* Ashley Schauer (1611)

## Installation

* `git clone git@github.com:turingschool-projects/MentorSHIP.git`
* `cd MentorSHIP`
* `bundle exec rake db:create db:migrate db:seed`

## Running / Development

So because of the Oauth Census had to use there are special instructions for running a local server. This walkthrough will get you set up to run a local HTTPS server so you can run dev server and test locally.

## 1) Create your private key (any password will do, we remove it below)

```
$ cd ~/.ssh
$ openssl genrsa -des3 -out server.orig.key 2048
```


## 2) Remove the password

```
$ openssl rsa -in server.orig.key -out server.key
```

## 3) Generate the CSR (Certificate Signing request)

```
$ openssl req -new -key server.key -out server.csr
```

## 4) Enter info for the CSR

Fill out the Common Name field as follows and skip the rest:

```
Common Name: localhost.ssl
```

## 5) Generate self signed ssl certificate

```
$ openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
```

## 6) Add localhost.ssl to your hosts file

```
$ echo "127.0.0.1 localhost.ssl" | sudo tee -a /private/etc/hosts
```

## 7) Install Figaro

```
$ bundle exec figaro install
```

This will add an application.yml file to your config folder.

## 8) Find the application keys and add them to your app.

On Slack, open the public channel called 'mentorship-project'. There are a series of snippets on that channel. One has all the application keys. Copy and paste that entire snippet into your application.yml file.

## 8) To start the SSL web server open another terminal window and run

thin start -p 3001 --ssl --ssl-key-file ~/.ssh/server.key --ssl-cert-file ~/.ssh/server.crt

 ### Travis-CI

Travis CI is a continuous integration tool that receives a webhook everytime you update a branch to a repo you've told it to follow. It deploys your application for each branch you pull request and runs your tests. If either of those things fail (deploying or tests) you will see a red X next to your pull request.

In order for it to work you must have a travis.yml file. The following is in our .travis.yml which essentially acts as a travis config and lives in your root directory.

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

When pushing to Heroku are making sure to complete the following rake tasks:

```
$ rake assets:clobber
$ rake asssets:precompile
# then recommit and push
  ```

Also, ensure your config variables for Heroku, Travis, and in the application.yml file all match. If they don't, Travis will fail and Heroku requests to Census will break.


### Where are the apps?

* Production environment:
  * https://shielded-meadow-66130.herokuapp.com
  * (DEPRECATED) https://turing-mentorship-prod.herokuapp.com/

* Staging environment:
  * (DEPRECATED) https://turing-mentorship-staging.herokuapp.com/

To get access to both of the above reach out to your Project Manager / Project Owner and they will add you to the app.

### Testing

To run the tests:

```
bundle exec rspec
```

### Important notes for seed file

To populate the seed file with mentors, we hit the Census API with a unique access token. This token expires every 90 days. The current token was generated on 05/30/2017. If you are trying to run `rake db:seed` after the last token was expired, you will need to OAuth in first and get a new access token.

To create a new token do the following:
* Place a `pry` at the top of Session#create method.
* Boot your `thin` server (See Running / Development for details) and log in with Census.
* After logging in, you will hit the `pry`, and in params find your unique access token.
* Update the `CENSUS_ACCESS_TOKEN` in the application.yml with this token.

### Environment Variables Needed

On Slack, open the public channel called 'mentorship-project'. There are a series of snippets on that channel. One has all the application keys. Copy and paste that entire snippet into your application.yml file.

## Endpoints

### Current Schema
![schema](http://i.imgur.com/JMVWZVx.png)

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

### Known Issues & Bugs
