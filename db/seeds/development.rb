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
  Team.create!(:team_number => a['team_number'], :nickname => a['nickname'], :name => a['name'], :key => a['key'], :website => a['website'], :locality => a['locality'], :region => a['region'], :country_name => a['country_name'], :location => a['location'], :events => a['events']) 
  puts "Team added. #{a['team_number']}"
end

puts "All Teams Added."

puts "\n2009 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2009.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2009") 
  puts "2009 Part added. #{a['name']}"
end

puts "All 2009 Parts Added."

puts "\n2010 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2010.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2010") 
  puts "2010 Part added. #{a['name']}"
end

puts "All 2010 Parts Added."

puts "\n2011 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2011.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2011") 
  puts "2011 Part added. #{a['name']}"
end

puts "All 2011 Parts Added."


puts "\n2012 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2012.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2012") 
  puts "2012 Part added. #{a['name']}"
end

puts "All 2012 Parts Added."


puts "\n2013 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2013.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2013") 
  puts "2013 Part added. #{a['name']}"
end

puts "All 2013 Parts Added."

puts "\n2014 Kit of Parts being added to database...
================================================\n"

jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop2014.json'))

jsonteams.each do |a| 
  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "2014") 
  puts "2014 Part added. #{a['name']}"
end

puts "All 2014 Parts Added."


def adduser(email, password, first_name, last_name, team_number)
  @user = User.invite!(:email => email, :first_name => first_name, :last_name => last_name, :team_number_id => team_number ) do |u|
    u.skip_invitation = true
  end
  token = Devise::VERSION >= "3.1.0" ? @user.instance_variable_get(:@raw_invitation_token) : @user.invitation_token
  User.accept_invitation!(:invitation_token => token, :password => password, :password_confirmation => password, :first_name => first_name, :last_name => last_name, :team_number_id => team_number )

  puts "Created User\n Email: #{email}\n Password: #{password}\n Name: #{first_name} #{last_name} \n Team: #{team_number} \n"
  @user
end

puts "\nCreating Test Users...
================================================\n"

user1 = adduser("user@example.com", "password", "test", "user", "1612")
user1 = adduser("user2@example.com", "password", "Another", "user", "21")
user1 = adduser("user3@example.com", "password", "Jack", "Bobbins", "79")


