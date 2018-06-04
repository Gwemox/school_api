json.school do
  json.id @school.id
  json.name @school.name
  json.address @school.address
  json.zip_code @school.zip_code
  json.city @school.city
  json.opening_hours @school.opening_hours
  json.phone_number @school.phone_number
  json.email @school.email
  json.latitude @school.latitude
  json.longitude @school.longitude
  json.student_number @school.student_number
  json.status @school.status
  json.created_at @school.created_at
  json.updated_at @school.updated_at
end
