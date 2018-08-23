# collections = Collection.create([
# 	{
# 		title: "Avatar the last airbender",
# 		description: "cool bro",
# 		tag_list: "Action, Fantasy",
# 		release: "2014-"
# 	}
# ])

Dir.glob("/Users/peter/Web/lucky_meta/movies/*").each do |mov|
	meta = YAML.load_file("#{mov}/meta.yaml")
	puts mov

	v = Video.create!({
		title: meta[:title],
		description: meta[:description],
		runtime_s: meta[:runtime].to_i*60,
		release: meta[:release],
		tag_list: meta[:genres]
	})
	v.poster.attach(io: File.open("#{mov}/poster.jpg"), filename: "poster.jpg") if File.file?("#{mov}/poster.jpg")
	v.cover.attach(io: File.open("#{mov}/backdrop.jpg"), filename: "backdrop.jpg") if File.file?("#{mov}/backdrop.jpg")
end

Dir.glob("/Users/peter/Web/lucky_meta/shows/*").each do |show|
	meta = YAML.load_file("#{show}/meta.yaml")

	c = Show.create!({
		title: meta[:title],
		description: meta[:description],
		tag_list: meta[:genres],
		release: "#{meta[:release_start]} - #{meta[:release_end]}"
	})
	c.poster.attach(io: File.open("#{show}/poster.jpg"), filename: "poster.jpg") if File.file?("#{show}/poster.jpg")
	c.cover.attach(io: File.open("#{show}/backdrop.jpg"), filename: "backdrop.jpg") if File.file?("#{show}/backdrop.jpg")

	Dir.glob("#{show}/seasons/*").each do |season|
		meta = YAML.load_file("#{season}/meta.yaml")

		s = Season.create!({
			title: meta[:title],
			description: meta[:description],
			show_id: c.id,
			season_number: File.basename(season).to_i
		})
		s.poster.attach(io: File.open("#{season}/poster.jpg"), filename: "poster.jpg") if File.file?("#{season}/poster.jpg")

		Dir.glob("#{season}/episodes/*").each do |episode|
			meta = YAML.load_file("#{episode}/meta.yaml")
			puts episode

			e = Video.create!({
				title: meta[:title],
				description: meta[:description],
				runtime_s: meta[:runtime].to_i*60,
				release: meta[:release],
				tag_list: meta[:genres],
				episode_number: meta[:episode_number],
				season_id: s.id,
				show_id: c.id
			})
			e.cover.attach(io: File.open("#{episode}/backdrop.jpg"), filename: "backdrop.jpg") if File.file?("#{episode}/backdrop.jpg")
		end
	end
end

# videos = Video.create([
# 	{
# 		title: "Star Wars",
# 		description: "yadda yadds",
# 		runtime_s: 60*60*1.5,
# 		release: "1998",
# 		tag_list: "Action, Sci-Fi"
# 	},{
# 		title: "Lord of the Rings",
# 		description: "absolute bro",
# 		runtime_s: 60*60*2,
# 		release: "2005",
# 		tag_list: "Action, Fantasy"
# 	},
# 	{
# 		title: "ninja man bro 1",
# 		description: "loloninjagod",
# 		collection_id: collections.first.id,
# 		season_id: 1,
# 		season_pos: 0,
# 		runtime_s: 60*20,
# 		release: "2014",
# 		tag_list: "Action, Fantasy"
# 	},
# 	{
# 		title: "ninja man bro 2",
# 		description: "loloninjagod",
# 		collection_id: collections.first.id,
# 		season_id: 1,
# 		season_pos: 1,
# 		runtime_s: 60*20,
# 		release: "2014",
# 		tag_list: "Action, Fantasy"
# 	},
# 	{
# 		title: "wallabe way",
# 		description: "loloninjagod",
# 		collection_id: collections.first.id,
# 		season_id: 2,
# 		season_pos: 0,
# 		runtime_s: 60*20,
# 		release: "2015",
# 		tag_list: "Action, Fantasy"
# 	}
# ])
# videos.each do |v|
# 	v.file.attach("path", "file.png")
# 	v.thumbnail.attach("path", "file.png")
# end
