# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  a = Game.create(name:"Alextown", description:"It's green!")
  b = Game.create(name:"BlancheCity", description:"Is blue!")
  d = Game.create(name:"Danville", description:"HOOSIERS!")
  m = Game.create(name:"Megalopolis", description:"SUPER!!")
  bamd = Game.create(name:"BAMD", description:"Great for teams! Da bomb!")

  coop = Mechanic.create(description:"co-op")
  cb = Mechanic.create(description:"city-building")

  a.mechanics << coop
  b.mechanics << cb
  m.mechanics << coop
  m.mechanics << cb
  d.mechanics << cb
  bamd.mechanics << coop
  bamd.mechanics << cb

a.ratings << Rating.create(stars: 2, comment:"This is stuff.")
b.ratings << Rating.create(stars: 2, comment: "this is a game???")
m.ratings << Rating.create(stars: 3, comment: "here is a thing maybe I dunno")
d.ratings << Rating.create(stars: 2, comment: "things and unicorns")
a.ratings << Rating.create(stars: 5, comment: "WOAH!")
