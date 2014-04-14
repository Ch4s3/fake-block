# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

[["kghosh1@students.towson.edu", "kajari"],
 ["chase.gilliam@gmail.com", "chase"],
 ["alex.ehrensberger@gmail.com", "alex"]
].each do |email, name|
  u = User.new(email: email, name: name, password: "12341234")
  u.add_role :admin
  u.save
end