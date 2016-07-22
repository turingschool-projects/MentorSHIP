json.student do
  json.id @student.id
  json.name @student.user.name
  json.email @student.user.email
  json.phone_number @student.user.phone_number
  json.slack_username @student.user.slack_username
  json.cohort @student.cohort.number
end
