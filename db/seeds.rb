# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Adding data to the database...\n
		==================================="

puts "Events being added to database...\n
		==================================="

jsonevents = ActiveSupport::JSON.decode(File.read('db/seeds/events.json'))

jsonevents.each do |a| 
  Event.create!(:key => a['key'], :name => a['name'], :short_name => a['short_name'], :start_date => a['start_date'], :end_date => a['end_date'], :official => a['official']) 
  puts "Event added. #{a['name']}"
end

puts "All Events Added."

puts "Teams being added to database...\n
		==================================="

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/teams.json'))

jsonteams.each do |a| 
  Team.create!(:team_number => a['team_number'], :nickname => a['nickname'], :name => a['name'], :key => a['key'], :website => a['website'], :locality => a['locality'], :region => a['region'], :country_name => a['country_name'], :location => a['location']) 
  puts "Team added. #{a['team_number']}"
end

puts "All Teams Added."
