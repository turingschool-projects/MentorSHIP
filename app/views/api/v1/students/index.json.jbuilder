json.students @students do |student|
  json.id student.id
  json.github_avatar student.user.github_avatar_url
  json.name student.user.name
  json.email student.user.email
  json.phone_number student.user.phone_number
  json.slack_username student.user.slack_username
  json.cohort student.cohort.number
end
