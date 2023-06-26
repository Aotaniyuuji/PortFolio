# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "________ create Admin"
Admin.create!(
   email: 'admin@aotani.com',
   password: 'aochan'
)

puts "________ create User"
User.create!(
   [
      {
         name: 'test',
         email: 'test@gmail.com',
         password: '0000000'
      }
   ]
)

puts "________ create Genre"
Genre.create!(
   [
      {
         name: "アクションRPG",
         is_active: true
      },
      {
         name: "ホラー",
         is_active: true
      },
      {
         name: "ソシャゲ",
         is_active: true
      },
      {
         name: 'アクション',
         is_active: true
      }
   ]
)

puts "________ create Game"
game = Game.create!(
   name: 'モンスターハンターワールド：Ice Borne',
   genre_id: 1,
   explanation: '過去一やり込んだシリーズ！
   新規のモンスターはもちろん、ハンターのアクションも多彩！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpeg')),filename: 'noimage.jpeg')

game = Game.create!(
   name: 'モンスターハンターワールド：Ice Borne',
   genre_id: 1,
   explanation: '過去一やり込んだシリーズ！
   新規のモンスターはもちろん、ハンターのアクションも多彩！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpeg')),filename: 'noimage.jpeg')
game = Game.create!(
   name: 'モンスターハンターワールド：Ice Borne',
   genre_id: 1,
   explanation: '過去一やり込んだシリーズ！
   新規のモンスターはもちろん、ハンターのアクションも多彩！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpeg')),filename: 'noimage.jpeg')

puts "________ create Reviews"
Review.create!(
   title: '名作！',
   comment: 'キャラメイクから世界観から全てが好き！
   やり込み要素も豊富で長く遊べるゲームです。',
   game_id:
   )