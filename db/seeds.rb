# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 11111111 11111111
# 123456789	123456789
User.create({ fullname: "Admin", gender: "Male", date_of_birth: "2002-05-03", citizen_id: 10101010, address: "123, Lardkrabang", contact_number: "10101010", password: "admin", password_confirmation: "admin", role: 1 })
User.create({ fullname: "Abdulhakim Maha", gender: "Male", date_of_birth: "2002-05-02", citizen_id: 11111111, address: "123, Lardkrabang", contact_number: "10101010", password: "11111111", password_confirmation: "11111111" })
User.create({ fullname: "Austin Iqer", gender: "Male", date_of_birth: "2002-05-02", citizen_id: 22222222, address: "123, Lardkrabang", contact_number: "10101010", password: "22222222", password_confirmation: "22222222" })
