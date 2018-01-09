# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
    {name: "Philippe", email: "philippe@ga.co", password: "123"},
    {name: "Jimmy", email: "jimmy@ga.co", password: "123"},
    {name: "Noel", email: "noel@ga.co", password: "123"},
])