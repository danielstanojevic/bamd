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


  settlers = Game.create!(name:"The Settlers of Catan", description: "Build, Trade, BEAT YOUR FRIENDS.")
  munchkin = Game.create!(name: "Munchkin", description: "BACKSTAB YOUR PUNK ASS FRIENDS.")
  werewolf = Game.create!(name: "Wereworlf", description: "Find the wolves, save the village!")
  guillotine = Game.create!(name: "Guillotine", description: "French Revolution! Beheadings! Laughs!")
  legendary = Game.create!(name: "Legendary", description: "Be a superhero from the marvel universe!")
  hobbit = Game.create!(name: "Hobbit", description: "Can you live until second breakfast???")
  ascension = Game.create!(name: "Ascension", description: "Made by some magic the gathering dudes.")
  clue = Game.create!(name: "Clue", description: "The family classic where you hunt a murderer!")
  hanabi = Game.create!(name: "Hanabi", description: "Don't blow your hands off!")
  tsuro = Game.create!(name: "Tsuro", description: "Follow the path less traveled.")












  coop = Mechanic.create(description:"Co-Op")
  cb = Mechanic.create(description:"City-Building")
  atc = Mechanic.create(description: "Area/Territory Control")
  ab = Mechanic.create(description: "Auction/Bidding")
  cd = Mechanic.create(description: "Card Drafting")
  db = Mechanic.create(description: "Deck Building")
  dx = Mechanic.create(description: "Dexterity")
  ec = Mechanic.create(description: "Economics")
  fg = Mechanic.create(description: "Fighting")
  ng = Mechanic.create(description: "Negotiation")
  pt = Mechanic.create(description: "Partnership")
  rm = Mechanic.create(description: "Resource Management")
  rp = Mechanic.create(description: "Role Playing")
  sc = Mechanic.create(description: "Set Collection")
  tp = Mechanic.create(description: "Tile Placement")
  st = Mechanic.create(description: "Secret Traitor")


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
