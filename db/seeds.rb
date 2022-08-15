# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{ email: "johng@example.com", first_name: "John", last_name: "Gibson", document_number: "70025447", password: "123456" },
         { email: "paulj@example.com", first_name: "Paul", last_name: "Johnson", document_number: "7004789", password: "123456" }
        ]

storages = [{ title: "accessible storage in city center", meters: '20', address: "175 Midway Ave", city: "London", price: 20.00, user_id: 2 },
         { title: "Spaceous storage", meters: '45', address: "84 Coventry Ave", city: "London", price: 50.00, user_id: 1 }
        ]


reservations = [{ start_date: "15/10/2022", end_date: "15/11/2022", user_id: 1, storage_id: 1},
                { start_date: "18/09/2022", end_date: "03/10/2022", user_id: 2, storage_id: 2}]


puts '------------Users------------'

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name} #{user.last_name} - #{user.email}"
end

puts '------------Storages------------'

storages.each do |attributes|
  storage = Storage.create!(attributes)
  puts "Created #{storage.title}"
end

puts '------------Reservations------------'

reservations.each do |attributes|
  reservation = Reservation.create!(attributes)
  puts "Created #{reservation.start_date} - #{reservation.end_date}"
end

puts 'Finished!'
