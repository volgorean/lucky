collections = Collection.create([
	{
		title: "Avatar the last airbender",
		description: "cool bro",
		tag_list: "Action, Fantasy",
		release: "2014-"
	}
])

videos = Video.create([
	{
		title: "Star Wars",
		description: "yadda yadds",
		runtime_s: 60*60*1.5,
		release: "1998",
		tag_list: "Action, Sci-Fi"
	},{
		title: "Lord of the Rings",
		description: "absolute bro",
		runtime_s: 60*60*2,
		release: "2005",
		tag_list: "Action, Fantasy"
	},
	{
		title: "ninja man bro 1",
		description: "loloninjagod",
		collection_id: collections.first.id,
		season_id: 1,
		season_pos: 0,
		runtime_s: 60*20,
		release: "2014",
		tag_list: "Action, Fantasy"
	},
	{
		title: "ninja man bro 2",
		description: "loloninjagod",
		collection_id: collections.first.id,
		season_id: 1,
		season_pos: 1,
		runtime_s: 60*20,
		release: "2014",
		tag_list: "Action, Fantasy"
	},
	{
		title: "wallabe way",
		description: "loloninjagod",
		collection_id: collections.first.id,
		season_id: 2,
		season_pos: 0,
		runtime_s: 60*20,
		release: "2015",
		tag_list: "Action, Fantasy"
	}
])
# videos.each do |v|
# 	v.file.attach("path", "file.png")
# 	v.thumbnail.attach("path", "file.png")
# end
