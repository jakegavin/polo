# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.create(name: "Boys Team")
Team.create(name: "Girls Team")

10.times do |x|
  Player.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, team: Team.first, number: x + 1, position: (x == 0 ? "Goalie" : "Utility"), grad_year: rand(2014..2017))
end

10.times do |x|
  Player.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, team: Team.last, number: x + 1, position: (x == 0 ? "Goalie" : "Utility"), grad_year: rand(2014..2017))
end

Coach.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, title: "Head Coach", email: Faker::Internet.free_email, bio: Faker::Lorem.sentences(rand(10..15)).join(" "))

Coach.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, title: "Assistant Coach", email: Faker::Internet.free_email, bio: Faker::Lorem.sentences(rand(10..15)).join(" "))

Tournament.create(name: "Spring Tournament", start_date: "2014-4-10", end_date: "2014-4-13", location: "Eugene, OR")

Tournament.create(name: "Summer Tournament", start_date: "2014-6-1", end_date: "2014-6-3", location: "Ashland, OR")

Tournament.create(name: "Fall Tournament", start_date: "2014-10-20", end_date: "2014-10-23", location: "Sacramento, CA")

Tournament.create(name: "State Championships", start_date: "2014-11-13", end_date: "2014-11-16", location: "Portland, OR")

Tournament.all.each do |tournament|
  8.times do
    Game.create(tournament: tournament, pool: "Amazon Pool", team_id: rand(1..2), opponent: Faker::Team.name, date: tournament.start_date + rand(0..2), time: Time.now + (rand(1..6)*60*60), home: [true, false].sample)
  end
end