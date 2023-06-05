# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 11111111 11111111
# 123456789	123456789
User.create({ fullname: "Admin Root", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 1010101010101, address: "123, Lardkrabang", contact_number: "1010101010", password: "admin123", password_confirmation: "admin123", role: 1 })
User.create({ fullname: "Abdulhakim Maha", gender: "Male", date_of_birth: "2002-05-02", citizen_id: 1111111111111, address: "123, Lardkrabang", contact_number: "1010101010", password: "11111111", password_confirmation: "11111111" })
User.create({ fullname: "Austin Iqer", gender: "Male", date_of_birth: "2002-05-02", citizen_id: 2222222222222, address: "123, Lardkrabang", contact_number: "1010101010", password: "22222222", password_confirmation: "22222222" })
