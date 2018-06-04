# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "admin@ynov.com",
  password: "jeankevinmangedesfrites",
  password_confirmation: "jeankevinmangedesfrites"
)

School.create(
  name: "Ynov Ingésup Informatique",
  address: "27 rue raoul servant",
  zip_code: "69007",
  city: "Lyon",
  opening_hours: "8h-19h",
  phone_number: "0800600633",
  email: "jean.kevin@ynov.com",
  latitude: 45.745686,
  longitude: 4.837593,
  student_number: 300,
  status: "private"
)
School.create(
  name: "Lycée René Cassin",
  address: "49 Boulevard des 9 Clés",
  zip_code: "71000",
  city: "Mâcon",
  opening_hours: "8h-19h",
  phone_number: "0385395350",
  email: "jean.kevin@cassin.fr",
  latitude: 46.314784,
  longitude: 4.821120,
  student_number: 1000,
  status: "public"
)
