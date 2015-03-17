require 'net/http'

namespace :update do
	# desc "Update parts from the json files."
	# task :parts, [:year] => [:environment] do |t, args|
	# 	year = args[:year].to_i

	# 	if year.to_s.size != 4 && year != 0
	# 		puts "ERROR: Year must be a 4 digit number."
	# 		next
	# 	elsif year == 0
	# 		puts "ERROR: You must provide a year. Format is \"update:parts[year]\""
	# 		next
	# 	end
			
		
	# 	jsonteams = ActiveSupport::JSON.decode(File.read('db/seeds/kop#{args[:year]}.json'))

	# 	if jsonteams.presence
	# 		puts "\n#{args[:year]} Kit of Parts being added to database...
	# 		================================================\n"

	# 		jsonteams.each do |a| 
	# 		  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "#{args[:year]}") 
	# 		  puts "#{args[:year]} Part added. #{a['name']}"
	# 		end

	# 		puts "All #{args[:year]} Parts Added."
	# 	else
	# 		puts "ERROR: No Parts file for that year."
	# 	end
		

	# end
	# desc "Update individual team."
	# task :team, [:teamnumber] => [:environment] do |t, args|

	# 	url = URI.parse("http://www.thebluealliance.com/api/v1/teams/show?teams=frc#{args[:teamnumber]}")
	# 	req = Net::HTTP::Get.new(url.to_s)
	# 	req.add_field("X-TBA-App-Id", "binofparts:team_scraper:1")
	# 	res = Net::HTTP.start(url.host, url.port) {|http|
	# 	  http.request(req)
	# 	}

		 
	# 	team = JSON.parse(res.body)
	# 	puts team

	# 	# teams = File.read('db/seeds/teams.json')
	# 	# objarray = JSON.parse(teams)

	# 	# objarray.push(res.body)
	# 	# # objarray.to_json
	# 	# puts objarray
	# 	#TODO: check to see if it was empty data before writing to file
	# 	# File.open("db/seeds/teams.json","w") do |f|
	# 	# 	f.puts objarray
	# 	# end

	# end
	desc "Update the test users."
	task :users => [:environment] do
		def adduser(email, password, first_name, last_name, team_number)
		  @user = User.invite!(:email => email, :first_name => first_name, :last_name => last_name, :team_number_id => team_number ) do |u|
		    u.skip_invitation = true
		  end
		  token = Devise::VERSION >= "3.1.0" ? @user.instance_variable_get(:@raw_invitation_token) : @user.invitation_token
		  User.accept_invitation!(:invitation_token => token, :password => password, :password_confirmation => password, :first_name => first_name, :last_name => last_name, :team_number_id => team_number )

		  puts "Created User\n Email: #{email}\n Password: #{password}\n Name: #{first_name} #{last_name} \n Team: #{team_number} \n"
		  @user
		end

		puts "\nCreating Test Users...\n
		================================================\n"

		user1 = adduser("admin@example.com", "password", "test", "admin", "")
	end
	desc "Update parts from the json files."
	task :parts => [:environment] do
		puts "clearing parts table"
		Part.destroy_all
		ActiveRecord::Base.connection.execute "UPDATE sqlite_sequence SET seq='0' WHERE name='parts';"
		(2009..2014).each do |i|
			jsonteams = ActiveSupport::JSON.decode(File.read("db/seeds/kop#{i}.json"))

			if jsonteams.presence
				puts "\n#{i} Kit of Parts being added to database...\n
				================================================\n"

				jsonteams.each do |a| 
				  Part.create!(:name => a['name'], :description => a['description'], :number => a['number'], :qty => a['qty'], :category => a['category'], :picture => a['picture'], :year => "#{i}") 
				  puts "#{i} Part added. #{a['name']}"
				end

				puts "All #{i} Parts Added."
			else
				puts "ERROR: Missing Parts file for #{i}."
			end
		end
	end
	desc "Update all teams."
	task :teams => [:environment] do
		#open file with a+
		#start loop
		#write each line to file
		#end loop
		#close file
		puts "This is going to take a while..."

		@teams = []
		(1..5786).each do |i|
			url = URI.parse("http://www.thebluealliance.com/api/v2/team/frc#{i}")
			req = Net::HTTP::Get.new(url.to_s)
			req.add_field("X-TBA-App-Id", "binofparts:teams_scraper:1")
			res = Net::HTTP.start(url.host, url.port) {|http|
			  http.request(req)
			}
			team_details = JSON.parse(res.body)
			if team_details.has_key?("Property Error")
				next
			end
			@teams.push(team_details)
			puts "Team #{i} added to array."
		end

		puts "Writing to json file..."
		File.open("db/seeds/teams.json","w") do |f|
	  		f.write(@teams.to_json)
		end

		puts "All done! :)"

	end
	desc "Update all events."
	task :events => [:environment] do

		url = URI.parse("http://www.thebluealliance.com/api/v2/events/")
		req = Net::HTTP::Get.new(url.path)
		req.add_field("X-TBA-App-Id", "binofparts:events_scraper:1")
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		File.open("db/seeds/events.json","w") do |f|
		  f.puts res.body
		end

	end
	# desc "Update individual event."
	# task :event, [:eventkey] => [:environment] do |t, args|

	# 	url = URI.parse("http://www.thebluealliance.com/api/v1/event/details?event=2014#{args[:eventkey]}")
	# 	req = Net::HTTP::Get.new(url.to_s)
	# 	req.add_field("X-TBA-App-Id", "binofparts:event_scraper:1")
	# 	res = Net::HTTP.start(url.host, url.port) {|http|
	# 	  http.request(req)
	# 	}
	# 	puts res.body

	# end
end