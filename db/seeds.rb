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
      {name: '田中太郎', email: 'tanaka@example.com', password: '0000000'},
      {name: '山田花子', email: 'yamada@example.com', password: '1111111'},
      {name: '佐々木小次郎', email: 'sasaki@example.com', password: '2222222'},
      {name: '徳川家光', email: 'tokugawa@exmaple.com', password: '3333333'},
      {name: '伊達政宗', email: 'date@example.com', password: '4444444'}
   ]
)

puts "________ create Genre"
Genre.create!(
   [
      {name: "アクションRPG"},
      {name: "ホラー"},
      {name: "ソシャゲ"},
      {name: 'AVG'}
   ]
)

puts "________ create Game"
game = Game.create!(
   name: 'SEKIRO SHADOWS DIE TWICE',
   genre_id: 1,
   explanation: 'フロムソフトウェアの代表作！
   革新的なバトルシステムが楽しすぎる！日本ゲーム大賞2019優秀賞受賞！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: 'バイオハザードRE:4',
   genre_id: 2,
   explanation: 'バイオ４のリメイク作品！ 期待を超える個人的神ゲー！！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: 'ELDEN RING',
   genre_id: 1,
   explanation: 'フロムソフトウェアの死にゲー最新作！
   世界観良し！アクション性良し！バトル良し！操作性！日本ゲーム大賞2022受賞!'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: 'モンスターハンターワールド：Ice Borne',
   genre_id: 1,
   explanation: '過去一やり込んだシリーズ！
   新規のモンスターが多く、ハンターのアクションも多彩！'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: '原神',
   genre_id: 3,
   explanation: 'オープンワールドRPG！基本無料なので気軽に遊べる。後キャラデザインがいい'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: 'あつまれ　どうぶつの森',
   genre_id: 4,
   explanation: 'どう森最新作！自分だけの島づくりができるアドベンチャーゲーム'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

game = Game.create!(
   name: 'Tails of ARISE',
   genre_id: 1,
   explanation: 'テイルズシリーズ最新作！バトルシステムは面白いが慣れるまでは少し難しいかも？'
)
game.image.attach(io: File.open(Rails.root.join('app/asset/images/noimage.jpg')),filename: 'noimage.jpg')

puts "________ create Reviews"
Review.create!(
   user_id: 1,
   game_id: 1,
   title: '神作！',
   comment: '和の世界観がたまらない。グラフィックもすごく良いのでやって損はないと思う'
)

Review.create!(
   user_id: 2,
   game_id: 3,
   title: 'フロムらしい',
   comment: 'キャラメイクから世界観から全てが好き！やり込み要素も豊富で長く遊べるゲームです。',
)

Review.create!(
   user_id: 5,
   game_id: 2,
   title: '神ゲー',
   comment: 'オリジナルと比べホラー感が増しているし、アクションも豊富で臨場感がすごい！',
)

Review.create!(
   user_id: 4,
   game_id: 1,
   title: '映像はいいが、、、',
   comment: 'かなり難しいゲームでやる気が途中で失せてしまった',
)