json.mentor do
  json.id @mentor.id
  json.github_avatar @mentor.user.github_avatar_url
  json.name @mentor.user.name
  json.email @mentor.user.email
  json.phone_number @mentor.user.phone_number
  json.slack_username @mentor.user.slack_username
  json.location @mentor.location
  json.timezone @mentor.mentor_timezone.name
  json.bio @mentor.bio
end
