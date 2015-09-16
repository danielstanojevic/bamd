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
  #
  cards = Game.create!(name: "Cards Against Humanity", description: "Be the worst you can be!")
  pandemic = Game.create!(name: "Pandemic", description: "Work together to beat deadly viruses!")
  takenoko = Game.create!(name: "Takenoko", description: "A panda eats bamboo and a gardener grows it.")
  betrayal = Game.create!(name: "Betrayal at House on the Hill", description: "Someone will betray you, and kill you all. Or not.")
  lords = Game.create!(name: "Lords of Waterdeep", description: "Complete quests, fight for control, manage your kingdom's resources. Fun!")
  fluxx = Game.create!(name: "Fluxx", description: "Rules change all the time. Keep up!")
  gloom = Game.create!(name: "Gloom", description: "Try to make your family as miserable as possible before they die.")
  elder = Game.create!(name: "Elder Sign", description: "Roll dice to see if you can work together to beat the monster!")
  battlestar = Game.create!(name: "Battlestar Galactica", description: "Someone's a cylon. They must be stopped.")
  candy = Game.create!(name: "Candy Land", description: "Seriously it's just boring if you're not four years old. I promise.")

# 10.times do
#   settlers.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   munchkin.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   werewolf.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   guillotine.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   legendary.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   hobbit.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   ascension.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   clue.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   hanabi.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   tsuro.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   cards.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   pandemic.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   takenoko.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   betrayal.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   lords.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   fluxx.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   gloom.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   elder.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   battlestar.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#   candy.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
#
#   end

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

  cards.mechanics << cd

  pandemic.mechanics << coop
  pandemic.mechanics << atc
  pandemic.mechanics << pt
  pandemic.mechanics << rm


  takenoko.mechanics << rm
  takenoko.mechanics << sc
  takenoko.mechanics << tp

  betrayal.mechanics << st
  betrayal.mechanics << pt
  betrayal.mechanics << tp
  betrayal.mechanics << rm

  lords.mechanics << rm
  lords.mechanics << sc
  lords.mechanics << rp

  fluxx.mechanics << sc
  fluxx.mechanics << db
  fluxx.mechanics << cd

  gloom.mechanics << sc
  gloom.mechanics << db
  gloom.mechanics << cd

  elder.mechanics << ng
  elder.mechanics << pt
  elder.mechanics << coop

  battlestar.mechanics << st
  battlestar.mechanics << pt
  battlestar.mechanics << atc
  battlestar.mechanics << rp
  battlestar.mechanics << ng
  battlestar.mechanics << fg

  candy.mechanics << sc
  candy.mechanics << cd



  settlers.mechanics << rm
  settlers.mechanics << tp
  settlers.mechanics << ec
  settlers.mechanics << atc
  settlers.mechanics << ng

  munchkin.mechanics << db
  munchkin.mechanics << fg
  munchkin.mechanics << pt
  munchkin.mechanics << coop
  munchkin.mechanics << ng

  werewolf.mechanics << st
  werewolf.mechanics << rp

  guillotine.mechanics << cd
  guillotine.mechanics << sc

 legendary.mechanics << db
 legendary.mechanics << coop
 legendary.mechanics << fg

 hobbit.mechanics << db

 ascension.mechanics << db
 ascension.mechanics << fg
 ascension.mechanics << rm

 clue.mechanics << st
 clue.mechanics << rp

 hanabi.mechanics << coop
 hanabi.mechanics << pt
 hanabi.mechanics << sc

 tsuro.mechanics << tp
 tsuro.mechanics << atc

  a.mechanics << coop
  b.mechanics << cb
  m.mechanics << coop
  m.mechanics << cb
  d.mechanics << cb
  bamd.mechanics << coop
  bamd.mechanics << cb


  # settlers.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # munchkin.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # werewolf.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # guillotine.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # legendary.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # hobbit.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # ascension.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # clue.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # hanabi.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # tsuro.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # cards.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # pandemic.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # takenoko.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # betrayal.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # lords.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # fluxx.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # gloom.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # elder.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # battlestar.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)
  # candy.ratings.create!( stars: [*1..5].sample, comment: Faker::Lorem.sentence, author: Faker::Internet.user_name)


15.times do
  u = User.create!( username: Faker::Internet.user_name,
                  password: "password!")
end

10.times do
  games = Game.all
    games.each do |game|
      game.ratings << Rating.create(stars: [*1..5].sample,
                                    comment: Faker::Lorem.sentence,
                                    author: User.all.select { |user| user.id == rand(1..10)}[0])
    end
  end

      # users.each do |user|
      #  user.ratings << Rating.create!(stars: [*1..5].sample, comment: Faker::Lorem.sentence)
    #   end
    # game.ratings << review
  # users = User.all
  # users.each do |user|
  #   user.ratings << Rating.create!(stars: [*1..5].sample, comment: Faker::Lorem.sentence)
  # end
  # games = Game.all
  #
  # games.each do |game|
  #   game.ratings << review
#   end
# end
  # settlers.ratings << review
  # munchkin.ratings << review
  # werewolf.ratings << review
  # guillotine.ratings << review
  # legendary.ratings << review
  # hobbit.ratings << review
  # ascension.ratings << review
  # clue.ratings << review
  # hanabi.ratings << review
  # tsuro.ratings << review
  # cards.ratings << review
  # pandemic.ratings << review
  # takenoko.ratings << review
  # betrayal.ratings << review
  # lords.ratings << review
  # fluxx.ratings << review
  # gloom.ratings << review
  # elder.ratings << review
  # battlestar.ratings << review
  # candy.ratings << review
