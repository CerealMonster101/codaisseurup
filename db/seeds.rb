Profile.delete_all
Registration.delete_all
Photo.delete_all
Category.delete_all
Event.delete_all
User.delete_all

#Categories
outdoors_and_adventure = Category.create(name: "Outdoors & Adventure")

technology_talks = Category.create(name: "Technology Talks")

startup_and_entrepreneurship = Category.create(name: "Startup & Entrepreneurship")

health_and_fitness = Category.create(name: "Health & Fitness")

foodies = Category.create(name: "Foodies")

amsterdam_happenings = Category.create(name: "Amsterdam Happenings")


#Users
vanessa = User.create(email: "vanessa@codaisseurbnb.com", password: "abcd1234")

hazel = User.create(email: "hazel@codaisseurbnb.com", password: "abcd2345")

victoria = User.create(email: "victoria@codaisseurbnb.com", password: "abcd3456")

tony = User.create(email: "tony@codaisseurbnb.com", password: "abcd4567")

#photos
photo1 = Photo.create!(remote_image_url:"http://res.cloudinary.com/dmagtxb3l/image/upload/v1489671193/Woman-in-a-Boat-in-a-Pond-in-a-Room--24482_xkkb2p.jpg")
photo2 = Photo.create!(remote_image_url:"http://res.cloudinary.com/dmagtxb3l/image/upload/v1489671193/bootcampsurvival_bekg5a.jpg")
photo3 = Photo.create!(remote_image_url:"http://res.cloudinary.com/dmagtxb3l/image/upload/v1489671193/veganbbq_wx5qax.jpg")
photo4 = Photo.create!(remote_image_url:"http://res.cloudinary.com/dmagtxb3l/image/upload/v1489671194/meetupparty_cjydmp.jpg")
photo5 = Photo.create!(remote_image_url:"http://res.cloudinary.com/dmagtxb3l/image/upload/v1489671193/meetup_old_ppl_uinr4h.jpg")



#Events
event1 = Event.create(name: "Vegan BBQ", description: "As much as it sounds like an oxymoron, vegan bbqs showcase delicious marinated veggies and cruelty-free foods hot off the grill", location: "Toronto", price: 15, capacity: 20,  includes_food: true, includes_drinks: true, starts_at: DateTime.new(2017,4,20,18,0,0), ends_at: DateTime.new(2017,4,20,23,0,0), active: true,  user: hazel, categories: [health_and_fitness, foodies], photos: [photo3])

event2 = Event.create(name: "Awesome Event", description: "The best awesome rooftop party offering free stroopwafels on the TQ rooftop", location: "Amsterdam", price: 20, capacity: 200,  includes_food: true, includes_drinks: true, starts_at: DateTime.new(2017,3,19,18,0,0), ends_at: DateTime.new(2017,3,19,23,0,0), active: true,  user: vanessa, categories: [amsterdam_happenings, foodies], photos: [photo4, photo5])

event3 = Event.create(name: "Bootcamp Bootcamp", description: "Bootcamp session teaching how to conduct bootcamps.  Can be applied to any industry", location: "Amstelveen", price: 2, capacity: 10,  includes_food: false, includes_drinks: false, starts_at: DateTime.new(2017,5,20,18,0,0), ends_at: DateTime.new(2017,5,20,23,0,0), active: true,  user: victoria, categories: [startup_and_entrepreneurship,technology_talks, health_and_fitness], photos:[photo2])

event4 = Event.create(name: "Ruby Gem Treasure Hunt", description: "The newest craze in gaming, ruby gems treasure hunting. We teach you how to find 'em", location: "Online", price: 25, capacity: 100,  includes_food: false, includes_drinks: false, starts_at: DateTime.new(2017,6,20,18,0,0), ends_at: DateTime.new(2017,6,20,23,0,0), active: true,  user: tony, categories: [technology_talks], photos: [photo5])

#Registrations

Registration.create(event: event1, user: tony, price: 15, starts_at: 10.days.from_now, ends_at: 12.days.from_now)
