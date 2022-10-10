# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [{ email: "johng@example.com", first_name: "John", last_name: "Gibson", document_number: "70025447", password: "123456" },
         { email: "paulj@example.com", first_name: "Paul", last_name: "Johnson", document_number: "7004789", password: "123456" },
         { email: "johnj@example.com", first_name: "John", last_name: "Jacob", document_number: "7004789", password: "123456" },
         { email: "carlm@example.com", first_name: "Carl", last_name: "Morrison", document_number: "7004789", password: "123456" },
         { email: "mariab@example.com", first_name: "Maria", last_name: "Best", document_number: "7004789", password: "123456" },
         { email: "claudiah@example.com", first_name: "Claudia", last_name: "Harrison", document_number: "7004789", password: "123456" },
         { email: "angusy@example.com", first_name: "Angus", last_name: "Young", document_number: "7004789", password: "123456" },
         { email: "mickj@example.com", first_name: "Mick", last_name: "Jagger", document_number: "7004789", password: "123456" },
         { email: "pauld@example.com", first_name: "Paul", last_name: "Davis", document_number: "7004789", password: "123456" }
        ]

storages = [{ title: "accessible storage in city center", meters: '20', address: "133 Victoria St", city: "London", country: "United Kingdom", price: 20.00, storage_type: "garage", user_id: 1 },
            { title: "Spaceous storage", meters: '45', address: "Rue du Béguinage 28", city: "Brussels", country: "Belgium", price: 50.00, storage_type: "garage", user_id: 2 },
            { title: "Lorem Ipsum", meters: '45', address: "Wilhelminastraat 152", city: "Amsterdam", country: "The Netherlands", price: 50.00, storage_type: "garage", user_id: 3 },
            { title: "Lorem Ipsum", meters: '55', address: "C. de Alcalá 35", city: "Madrid", country: "Spain", price: 50.00, storage_type: "garage", user_id: 4 },
            { title: "Lorem Ipsum", meters: '65', address: "Av. del Carrilet 179", city: "Barcelona", country: "Spain", price: 50.00, storage_type: "garage", user_id: 5 },
            { title: "Lorem Ipsum", meters: '15', address: "6001 Vermont Ave", city: "Los Angeles", country: "United States", price: 50.00, storage_type: "garage", user_id: 6 },
            { title: "Lorem Ipsum", meters: '25', address: "1905 Curry Ford Rd", city: "Orlando", country: "United States", price: 50.00, storage_type: "garage", user_id: 7 },
            { title: "Lorem Ipsum", meters: '35', address: "25 Walton St", city: "London", country: "United Kingdom", price: 50.00, storage_type: "garage", user_id: 8 },
            { title: "Lorem Ipsum", meters: '45', address: "Av. da Liberdade 93", city: "Lisbon", country: "Portugal", price: 50.00, storage_type: "garage", user_id: 9 },
            { title: "Lorem Ipsum", meters: '55', address: "51 Waterford Rd", city: "London", country: "United Kingdom", price: 50.00, storage_type: "garage", user_id: 1 },
            { title: "Lorem Ipsum", meters: '15', address: "Rue de la Blanchisserie 31", city: "Brussels", country: "Belgium", price: 50.00, storage_type: "garage", user_id: 2 },
            { title: "Lorem Ipsum", meters: '25', address: "1325 Valencia St", city: "San Francisco", country: "United States", price: 50.00, storage_type: "garage", user_id: 3 },
            { title: "Lorem Ipsum", meters: '35', address: "100 Av. de la République", city: "Paris", country: "France", price: 50.00, storage_type: "garage", user_id: 4 },
            { title: "Lorem Ipsum", meters: '45', address: "Stephensonstraat 33", city: "Amsterdam", country: "The Netherlands", price: 50.00, storage_type: "garage", user_id: 5 },
            { title: "Features Test", meters: '45', address: "20 Old Montague St", city: "London", country: "United Kingdom", price: 50.00, storage_type: "garage", features: ["Pet Free", "Security Camera", "Smoke Detector", "Climate Controlled"], user_id: 2 }
        ]


reservations = [{ start_date: "15/10/2022", end_date: "15/11/2022", user_id: 1, storage_id: 2},
                { start_date: "18/09/2022", end_date: "03/10/2022", user_id: 2, storage_id: 1}]


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
