json.students @students do |student|
  json.name student.user.name
  json.email student.user.email
  json.phone_number student.user.phone_number
  json.slack_username student.user.slack_username
  json.cohort student.cohort.number
end
