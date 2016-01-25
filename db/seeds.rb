# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(firstname: "Bob", lastname: "Jones", email: "bob@jones.com", password_digest: "password")
User.create(firstname: "Jill", lastname: "Bobs", email: "jill@bobs.com", password_digest: "password")
