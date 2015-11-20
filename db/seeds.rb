# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{
		name: "Dillon",
		email: "dillon@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Aldo",
		email: "aldo@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Christian",
		email: "christian@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Kingsley",
		email: "kingsley@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Nathaniel",
		email: "nathaniel@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Hangula",
		email: "hangula@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "Jeremy",
		email: "jeremy@example.com",
		password: "secret",
		password_confirmation: "secret"
	},
	{
		name: "DeWet",
		email: "dewet@example.com",
		password: "secret",
		password_confirmation: "secret"
	}
])