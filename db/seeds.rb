# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

Room.create(
  id: 1,
  name: 'My room',
  serialnumber: '106438091648560',
  user_email: 'send.s2027091@gmail.com',
  family_email: 's2027091@nbu.ac.jp',
)
Room.create(
  id: 2,
  name: 'Living',
  serialnumber: '229334319410736',
  user_email: 'send.s2027091@gmail.com',
  family_email: 's2027091@nbu.ac.jp',
)
Room.create(
  id: 3,
  name: 'Test room',
  serialnumber: '202027091',
  user_email: 'sryusuke1030@gmail.com',
  family_email: 's2027091@nbu.ac.jp',
)

CSV.foreach('db/temperature.csv', headers: true) do |row|
  Temperature.create(
    temperature: row['temperature'],
    room_id: row['room_id'],
    created_at: row['created_at']
  )
end