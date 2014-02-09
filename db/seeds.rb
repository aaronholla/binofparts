# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "\nAdding data to the database...
================================================\n\n\n"

puts "\nEvents being added to database...
================================================\n"

jsonevents = ActiveSupport::JSON.decode(File.read('db/seeds/events.json'))

jsonevents.each do |a| 
  Event.create!(:key => a['key'], :name => a['name'], :short_name => a['short_name'], :start_date => a['start_date'], :end_date => a['end_date'], :official => a['official']) 
  puts "Event added. #{a['name']}"
end

puts "All Events Added."

puts "\nTeams being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/teams.json'))

jsonteams.each do |a| 
  Team.create!(:team_number => a['team_number'], :nickname => a['nickname'], :name => a['name'], :key => a['key'], :website => a['website'], :locality => a['locality'], :region => a['region'], :country_name => a['country_name'], :location => a['location']) 
  puts "Team added. #{a['team_number']}"
end

puts "All Teams Added."

puts "\n2013 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2013.json'))

jsonteams.each do |a| 
  Kop2013.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture']) 
  puts "2013 Part added. #{a['name']}"
end

puts "All 2013 Parts Added."

puts "\n2012 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2012.json'))

jsonteams.each do |a| 
  Kop2012.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture']) 
  puts "2012 Part added. #{a['name']}"
end

puts "All 2012 Parts Added."

puts "\n2011 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2011.json'))

jsonteams.each do |a| 
  Kop2011.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture']) 
  puts "2011 Part added. #{a['name']}"
end

puts "All 2011 Parts Added."

puts "\n2010 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2010.json'))

jsonteams.each do |a| 
  Kop2010.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture']) 
  puts "2010 Part added. #{a['name']}"
end

puts "All 2010 Parts Added."

puts "\n2009 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2009.json'))

jsonteams.each do |a| 
  Kop2009.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture']) 
  puts "2009 Part added. #{a['name']}"
end

puts "All 2009 Parts Added."


