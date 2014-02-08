require 'net/http'

namespace :update do
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
	desc "Update all teams."
	task :teams => [:environment] do

		puts "This is going to take a while..."

		@teams = []
		(1..5352).each do |i|
			url = URI.parse("http://www.thebluealliance.com/api/v1/team/details?team=frc#{i}")
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

		url = URI.parse("http://www.thebluealliance.com/api/v1/events/list")
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