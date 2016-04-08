# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


response = HTTParty.get('https://data.cityofnewyork.us/resource/h87e-shkn.json')
response.each do |item|
	Toilet.create(
		name: item['name'],
		location: item['location'],
		description: item['type']
	)
end

puts Toilet.count

Toilet.all.each do |toilet|
    address = toilet.location.gsub(" ", "+") + ",+New+York+City,+NY"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyALN7GVrxfs8xQmQ1Rn1AXZe-uOGd3muVU"
  response = HTTParty.get(url)
  begin
    if response["status"] == "OK"
      toilet.zip_code = nil
      toilet.neighborhood = response["results"][0]["address_components"][1]["long_name"]
      toilet.sublocality = response["results"][0]["address_components"][2]["long_name"]
      toilet.latitude = response["results"][0]["geometry"]["location"]["lat"]
      toilet.longitude = response["results"][0]["geometry"]["location"]["lng"]
      toilet.save
    end
  rescue
  end
end

User.create!(username:  "fj",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             zip_code: Faker::Address.zip,
             gender: Faker::StarWars.specie,
             admin: true)

20.times do
	User.create({
		username: Faker::Hipster.word,
		password: 'foobar',
    password_confirmation: 'foobar',
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		zip_code: Faker::Address.zip,
		gender: Faker::StarWars.specie
		})
end

Toilet.all.each do |toilet|
	5.times do
		Review.create({
			toilet_id: toilet.id,
			review_text: Faker::Hipster.paragraphs(3)[0] + Faker::Hipster.paragraphs(3)[1] + Faker::Hipster.paragraphs(3)[2],
			reviewer_id: rand(1..20),
			rating: rand(1..5)
			})
	end
end