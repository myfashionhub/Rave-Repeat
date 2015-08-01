require 'csv'

CSV.foreach("#{Rails.root}/db/festivals-2015.csv") do |row|
  Festival.find_or_create_by(
    name: row[0],
    location: row[1],
    start_date: row[2],
    end_date: row[3],
    playlist: row[4],
    playlist_scid: row[5],
    status: row[6],
    lineup: row[7].split(',')
  )

  existing_festival = Festival.find_by(playlist: row[4])
  unless existing_festival.nil?
    existing_festival.update(
      name: row[0],
      location: row[1],
      start_date: row[2],
      end_date: row[3],
      playlist: row[4],
      playlist_scid: row[5],
      status: row[6],
      lineup: row[7].split(',')
    )
  end
end

# Initial user db seed
names = ['ploxiln', 'Paul H1am', 'Daul Be', 'Nathan Lee',
'Jason_on_the_block', 'Clara T', 'Kaylee182', 'EDM Sauce',
'Becky', 'Skrillex4life', 'Il0veCalvinHarris', 'born2rave',
'Bass_drop002', 'Trance_or_die', 'haveuseenmolly']

names.each do |name|
  Raver.create(name: name)
end

Raver.all.each do |raver|
  festival1 = Festival.all.sample
  festival2 = Festival.all.sample
  Trip.create(raver_id: raver.id, festival_id: festival1.id,
    start_date: festival1.start_date - 1, end_date: festival1.end_date + 1)
  Trip.create(raver_id: raver.id, festival_id: festival2.id,
    start_date: festival2.start_date - 1, end_date: festival2.end_date + 1)
end

# Heroku seed dump

Flight.create!([
  {airline: "US Airways\n                        &nbsp;/\n        American Airlines", leg1: "LaGuardia 3:30p =&gt; Miami 6:51p 3h 21m", leg2: "Miami 9:10p =&gt; Intl 11:53p 2h 43m", price: "$432", link: "http://kayak.comjavascript:showPriceSelections(1183, null, 'splitbook');", trip_id: 1},
  {airline: "US Airways\n                        &nbsp;/\n        American Airlines", leg1: "LaGuardia 3:30p =&gt; Miami 6:51p 3h 21m", leg2: "Miami 7:45p =&gt; Intl 10:32p 2h 47m", price: "$432", link: "http://kayak.comjavascript:showPriceSelections(1286, null, 'splitbook');", trip_id: 1},
  {airline: "American Airlines", leg1: "New York, NY- LaGuardia 6:29a =&gt; Chicago, IL- O'Hare International 7:54a", leg2: "Chicago, IL- O'Hare International 6:40p =&gt; New York, NY- LaGuardia 9:50p", price: "$356", link: "http://kayak.com/book/flight?code=1736083982.JBACCsWA7L.0.F.AA,AA.35600.b3188b29b7adef251597575d292115d0&sub=E-1098890dde0&resultid=b3188b29b7adef251597575d292115d0&sr=1&pg=1&cp=0-683-1416", trip_id: 8},
  {airline: "United", leg1: "New York, NY- LaGuardia 7:00a =&gt; Chicago, IL- O'Hare International 8:31a", leg2: "Chicago, IL- O'Hare International 8:00a =&gt; New York, NY- LaGuardia 11:09a", price: "$302", link: "http://kayak.com/book/flight?code=2142313610.JZACDrfGZR.0.F.UA,ITA.30200.204adb31047b461011228170fdda9ef4&sub=E-1bc44bad262&resultid=204adb31047b461011228170fdda9ef4&sr=1&pg=1&cp=0-711-1435", trip_id: 8},
  {airline: "Spirit Airlines", leg1: "New York, NY- LaGuardia 8:35a =&gt; Chicago, IL- O'Hare International 10:04a", leg2: "Chicago, IL- O'Hare International 5:56a =&gt; New York, NY- LaGuardia 9:00a", price: "$348", link: "http://kayak.com/book/flight?code=-632772259.JaACAFGGsz.0.F.PRICELINEFLIGHTSWHISKY,PRICELINEFLIGHTSWHISKY.34800.ac1e62200bed610dbedd4be06c29425e&sub=E-144d6d94d65&resultid=ac1e62200bed610dbedd4be06c29425e&sr=1&pg=1&cp=0-1118-1523", trip_id: 26},
  {airline: "JetBlue Airways\n                        &nbsp;/\n        American Airlines", leg1: "New York, NY- John F Kennedy Intl 11:47a =&gt; Chicago, IL- O'Hare International 1:12p", leg2: "Chicago, IL- O'Hare International 7:35p =&gt; New York, NY- John F Kennedy Intl 11:05p", price: "$391", link: "http://kayak.comjavascript:showPriceSelections(1470, null, 'splitbook');", trip_id: 27},
  {airline: "American Airlines", leg1: "New York, NY- John F Kennedy Intl 2:21p =&gt; Miami, FL- Miami 5:40p", leg2: "Miami, FL- Miami 6:40p =&gt; New York, NY- John F Kennedy Intl 9:42p", price: "$472", link: "http://kayak.com/book/flight?code=-1625066798.JaACD6mAAN.0.F.AA,AA.47165.6882e6ecee957aa99336741a23acf37f&sub=E-1098890dde0&resultid=6882e6ecee957aa99336741a23acf37f&sr=1&pg=1&cp=0-76-1257", trip_id: 29},
  {airline: "Delta", leg1: "New York, NY- LaGuardia 12:00p =&gt; Atlanta, GA- Hartsfield-Jackson  2:41p", leg2: "Atlanta, GA- Hartsfield-Jackson  9:45p =&gt; New York, NY- LaGuardia 11:59p", price: "$284", link: "http://kayak.com/book/flight?code=1888749686.JbACAVgfMF.0.F.DL,DL.28400.07f94c39cfb1e85906ee53274ad8c8a8&sub=E-1fe1f8131ce&resultid=07f94c39cfb1e85906ee53274ad8c8a8&sr=1&pg=1&cp=0-190-1368", trip_id: 30},
  {airline: "JetBlue Airways", leg1: "New York, NY- John F Kennedy Intl 1:00p =&gt; Chicago, IL- O'Hare International 2:29p", leg2: "Chicago, IL- O'Hare International 4:43p =&gt; New York, NY- John F Kennedy Intl 8:00p", price: "$427", link: "http://kayak.com/book/flight?code=-254465794.JcECCktPx_.0.F.B6,ITA.42700.dd6c2d2cffe4ad8bd07287a7632abfc5&sub=E-12cadbe4b02&resultid=dd6c2d2cffe4ad8bd07287a7632abfc5&sr=1&pg=1&cp=0-57-1518", trip_id: 33},
  {airline: "American Airlines", leg1: "New York, NY- LaGuardia 6:29a =&gt; Chicago, IL- O'Hare International 7:54a", leg2: "Chicago, IL- O'Hare International 7:55p =&gt; New York, NY- LaGuardia 10:55p", price: "$382", link: "http://kayak.com/book/flight?code=-1470632063.JYACAmQVDz.0.F.AA,AA.38200.6559765f814e0bd642e12e31dc178525&sub=E-1098890dde0&resultid=6559765f814e0bd642e12e31dc178525&sr=1&pg=1&cp=0-671-1415", trip_id: 26},
  {airline: "American Airlines", leg1: "New York, NY- John F Kennedy Intl 2:21p =&gt; Miami, FL- Miami 5:40p", leg2: "Miami, FL- Miami 7:45p =&gt; New York, NY- John F Kennedy Intl 10:32p", price: "$478", link: "http://kayak.com/book/flight?code=-1011810826.JoACB2ahNV.0.F.AA,AA.47785.e3a87b4fd947ba997d2e6ce27348c3d7&sub=E-1098890dde0&resultid=e3a87b4fd947ba997d2e6ce27348c3d7&sr=1&pg=1&cp=0-60-400", trip_id: 29},
  {airline: "JetBlue Airways", leg1: "Boston, MA- Logan International 9:30a =&gt; Newark, NJ- Newark 10:49a", leg2: "Newark, NJ- Newark 11:25a =&gt; Boston, MA- Logan International 12:29p", price: "$117", link: "http://kayak.com/book/flight?code=1340128569.JpACCxlA_C.0.F.B6,ITA.11620.0af7718593d5eb150defaeb015972180&sub=E-12cadbe4b02&resultid=0af7718593d5eb150defaeb015972180&sr=1&pg=1&cp=0-2240-2767", trip_id: 32},
  {airline: "JetBlue Airways", leg1: "Boston, MA- Logan International 9:30a =&gt; Newark, NJ- Newark 10:49a", leg2: "Newark, NJ- Newark 11:25a =&gt; Boston, MA- Logan International 12:29p", price: "$117", link: "http://kayak.com/book/flight?code=1340128569.JpACCxlA_C.0.F.B6,ITA.11620.0af7718593d5eb150defaeb015972180&sub=E-12cadbe4b02&resultid=0af7718593d5eb150defaeb015972180&sr=1&pg=1&cp=0-2129-2790", trip_id: 32},
  {airline: "United", leg1: "Newark, NJ- Newark 2:59p =&gt; Las Vegas, NV- McCarran 5:25p", leg2: "Las Vegas, NV- McCarran 9:50p =&gt; Newark, NJ- Newark 5:30a", price: "$760", link: "http://kayak.com/book/flight?code=-471628775.JkACDvqg1_.0.F.UA,ITA.75970.564dbd3a9884aa21fb187fcfa69b6137&sub=E-1bc44bad262&resultid=564dbd3a9884aa21fb187fcfa69b6137&sr=1&pg=1&cp=0-49-1487", trip_id: 53},
  {airline: "American Airlines", leg1: "New York, NY- John F Kennedy Intl 7:30a =&gt; Las Vegas, NV- McCarran 10:00a", leg2: "Las Vegas, NV- McCarran 8:02a =&gt; New York, NY- John F Kennedy Intl 4:07p", price: "$544", link: "http://kayak.com/book/flight?code=-649602392.JBACDdFxz9.0.F.AA,AA.54400.5ca05331a510846e4f9ba9773b3cf6f5&sub=E-1098890dde0&resultid=5ca05331a510846e4f9ba9773b3cf6f5&sr=1&pg=1&cp=0-79-1578", trip_id: 55}
])
Raver.create!([
  {name: "_Myfashionhub", image: "http://pbs.twimg.com/profile_images/472430378091696128/QNKDu-1H_normal.jpeg", twitter_token: "240042413-GkahqM0n3dhrdd2lEQd4z0n39F2cTkfXL7lWAZoS", twitter_token_secret: "rMQcr8VoFK4ct15Wqigkmc2SJLVxv7902Agt1qyAMxozf", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Trevoke", image: "http://pbs.twimg.com/profile_images/378800000128937175/501eb2fa8663149c3365f8581b371185_normal.jpeg", twitter_token: "23029630-OQZrP2CjGi8T0EzEm3Mna0hNixkpmRRSeXt7SlBaG", twitter_token_secret: "a3E5z47h1nbvDavwRfBo38MxDtKYL4aETlPVLFB2HyR69", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Corey Leveen", image: "http://graph.facebook.com/10152537230841223/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152537230841223", facebook_token: "CAAHuVj8MUYgBAMW4gqi9zQBaP5DbuDxKXlbymhOZAlu4EDPbq5TDMZBZCDJZBobeUVtLKHovN92peZBW3NUVLRsa4Aj5Hg5KhAChSNu6RwpQ80zhzvFbbpQzuDqN0vxvihgZBjANH8ckZAdxeBqfmUHvwgZArn6bgCiT0gUbY9T6YrT49iEC7JYl5EiJoOSu8iEZD", location: nil, lineup: []},
  {name: "JohnMur58393835", image: "http://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png", twitter_token: "1282243189-Nfd1L9i4yyFWZR28HvUSsZPV71nv482ehSG99o4", twitter_token_secret: "fixJTFFP7oWQtbuKdowwpDn8VDlaAeWgDmuIYbs4ywNPI", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Pierce Lopez", image: "http://graph.facebook.com/10100483261112699/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10100483261112699", facebook_token: "CAAHuVj8MUYgBAMi3BNt6wFGUpaZCSgy59UXaFcs1n1hZBA1ZB8CMgXKU8d5ZBMLuSALQJscPRbs1X7Pb8nZBHCQtJzyQQBL9djK1vDzANAQCOmoD5FBrd1XNF2JxqLa2Y9J72yYwq8SUUOv6GQ7bErLK4zs48t0ZBLjLk9OgWlokxHjxv9sDfY83Y6HD35O0S70e78j3Q3bpaQMKY7XfAY", location: nil, lineup: []},
  {name: "ploxiln", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Paul H1am", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Daul Be", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Nathan Lee", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Jason_on_the_block", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Clara T", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Kaylee182", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "EDM Sauce", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Becky", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Skrillex4life", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Il0veCalvinHarris", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "born2rave", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Bass_drop002", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Trance_or_die", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "haveuseenmolly", image: nil, twitter_token: nil, twitter_token_secret: nil, facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Nessa Nguyen", image: "http://graph.facebook.com/10152165591861487/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152165591861487", facebook_token: "CAAHuVj8MUYgBACBMmyg8nmREHkZBbGZAX6K6yESuxJ6E3OnwGLGVronMVk1LoJsaDeOqUKmA0ZBDqjY2O9pTV4yNHgyBK2HcqDfZAGvqePuDxGZBFA9ALHPZBdbRfB5nvN0BlU3eSBiPwPKe9QTRiBfrNXzfxgvKqlcVt4QQ8tA7evr2pR1NkCWYJvJZBZAnN774j6k4Gn8ZB4uLEuPO78SJh", location: nil, lineup: []},
  {name: "delia421", image: "http://pbs.twimg.com/profile_images/471844559941402624/0GVqJHgB_normal.jpeg", twitter_token: "382563042-xHiIfaGJjtD5uEP3BeCM0zePgM9S365dKefPbCjK", twitter_token_secret: "AgZxIaOI8EX0a8E6O7kFtOuLwhAYxFBu6Lqq59SqfR4SG", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Daul Be", image: "http://graph.facebook.com/10203847601566169/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10203847601566169", facebook_token: "CAAHuVj8MUYgBABS49fiXjxHpfo8X86kxZAwl7mOxLecKjMd0k8tIXsvuK5prA7uvkE9eRy7vjLyUTZCfNwZAvYPAFZCj0QaMhIA999HCfhh9E9Sy5HMajhs0HQWJBytzWz6r9yHCSGAtWFNlmZCWuwKz0dpcXCMQnXZAOZBdCQn45oXvM0GHE45kdKDVkHnpXc5e034M6hKaZAVRIBelhJB6", location: nil, lineup: []},
  {name: "Clara Tran", image: "http://graph.facebook.com/10152489256849299/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152489256849299", facebook_token: "CAAHuVj8MUYgBAAO7bHNKJVZAUVxchL9eCLaCt8uCcLAgZAfh6o86bOg3bB0ZCD5D0na2iEsA1qEt5g4ZBlvnvJN7bcC8LpdDk9AWLqb65mrxYsef5ZAz6Vtf4tHgvsHGdDQpgoZCd8OClXhTwxCPxdEJmh2ZB8Pmm7O9tZCRasYXn2pmTthzJJwb7IAcGhAMKj7DKEsY22fVC73KonkTgAm5", location: nil, lineup: []},
  {name: "Andru Weir", image: "http://graph.facebook.com/10152273020507993/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152273020507993", facebook_token: "CAAHuVj8MUYgBAJ8i8B8JpFayVy3EH4lvFhgr9BMMtatOYZB8WeBg8gEecGRCCE3YkKiJtL09g8OeyeBBI5gsEMUMkKwMlvodRRMEaFoQVLxbB6RuDZC1jajJlfiMJyZBWf4linccjTk1B30e3LKBGB0yqxgfaa8dogK7DsjhkrQc9uNJMfQO0tXn6L3m8wOqnFZCBMEGUjTVKZCSP6Ony", location: nil, lineup: []},
  {name: "NightLifeXapp", image: "http://pbs.twimg.com/profile_images/478651674433560576/liqzB0P5_normal.png", twitter_token: "2453859956-TfLL7EGg8NcpiWSrDhcylO4a7O4zc5QIFWYji9N", twitter_token_secret: "7XsHriY224ZFJNSjXNge18va8m6zNLtMhzB5nRsMjAZpp", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Matt Patai", image: "http://graph.facebook.com/535691636558944/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "535691636558944", facebook_token: "CAAHuVj8MUYgBAEMcZBfz5wxS3V5A4A6H6CwmCXuBWGmfum3QBdyLZAdbzCoVd0e8I7uSJgqheNTfMxL9CpMrBpu7UzvNu7RTu3MWQzrm2SZCOIzoypavFBxBbbXuQrU3ayZBuGCRPgfOmdl5ZCkOSv7fPNqi1xtYf44EBGihYi5JbwIsZC6UiTZA9h5Lmb8Ew42gcoOujvDnHBTYrnM85p1", location: nil, lineup: []},
  {name: "VietFromVietnam", image: "http://pbs.twimg.com/profile_images/3525155842/4f1796e099f3894b58b3460d76499397_normal.jpeg", twitter_token: "556136260-35VWlcTy0UFDMIADFJvdJblQ2cIp3IsDKhGiGCc7", twitter_token_secret: "OvrXKX25SVbeYeAYh5IZhAUDxKMd3bXOXfMh3eM9mQFuC", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Janet Cho", image: "http://graph.facebook.com/10204375186005597/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10204375186005597", facebook_token: "CAAHuVj8MUYgBAFdZCTSdiLClVZBwbLTDh20O6ZByvkBlrpLyziQF7zAVhvloqBYPK1xH7A50VtthByNmgdj4ZCXGPW2JUP8JZAl1McUfeVXwR64LX4ywFL62XKydsnJfZAEUpPkZAS1SLIkIWd5F7YOkw2GwNcNZBTTJEvszbYdTZAQOsyILH0RHMLJSPYhmH9jGjj4ZCSqKlupzAT6o23XhzT", location: nil, lineup: []},
  {name: "Van Dinh", image: "http://graph.facebook.com/10203582226692863/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10203582226692863", facebook_token: "CAAHuVj8MUYgBAPc5RmTuZBnbcqFhjHmI7IloCDhFZC69xDeWvj6OBaJLHbhT1mLgZA70gtfd4QUCLLSflC0deFOgjuPD0uYFRIIVcca4km72hB7unM78GIHcV7di9fEO3ZB8uNZBWJ7n1claGuMZBBm4qB8ZBUCHZBipJWOKMWNhm7HCc1lNqSUdzZAGFk3G5WRmQKMSGvVFsjsY2waKtshjl", location: nil, lineup: []},
  {name: "Huyen Tran", image: "http://graph.facebook.com/688880427832497/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "688880427832497", facebook_token: "CAAHuVj8MUYgBAOLMX7vcuDwhjV1Sr4hj0vZCepyIWlXxTsxc5gEOcUk5Nm3sqOE9lVrCGqTAu83mZBke9rBlJg9BUQsNX1LCN5tZAaYfQR2zk66j8GCsZAaoahmFDW4FHnWHw2LmKWCvo5dbW8tbKaBUjm2vJCmCDPU7pmKd79SRStocKDzuEZCElefPwzmQPsWpz07Vg2FvagzLtumit", location: nil, lineup: []},
  {name: "Invadervimm", image: "http://pbs.twimg.com/profile_images/449560728102387713/S8CQNsIO_normal.jpeg", twitter_token: "176324270-DQzdGOeEqOkDsTT9zrkhS196VeqtS7KCF7MIZCLG", twitter_token_secret: "AIMJpsegeRMHz0mDPGZRNJyvKETyzVRMsjGNOMhM479mX", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Lucas Garcia De Polavieja", image: "http://graph.facebook.com/10152741532099258/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152741532099258", facebook_token: "CAAHuVj8MUYgBAE9Rm0kDRTWVycWrRsErKOxbxvFVjm08ZARZAdbZAx4fszTotSaXTDV8Kj0TyZAP1ZB9vPb506Fa5Smy3Wylg8PEVX1amYVF3aNZBHZC6OhC27gCbWE0zAHxIFVhUzPZAZAJ8knJJ7DhH6gtiFYaddKRc6ezpInHI8AD99CuxN5a7mZAO229x4QQvrRU1CZBPupjZCwT97KTxbhF", location: nil, lineup: []},
  {name: "Matt Lukashovitz", image: "http://graph.facebook.com/10152516693987221/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10152516693987221", facebook_token: "CAAHuVj8MUYgBAEcejusnTazZB50zj9OaxxBXe5aWRHN0kPYOMflZALAZCf4R53fenqOKAVCWEhIey7kTNASMaax3nTgp1dhhnNREA2Ggu7rga7hZAmdYsIqzV3pSX4ugoYyqn3ZB5IoSpNpiPhoRNSZBgdXKSXnYXA2GhZAiUq5MvEe3Q1sd8DKZAynHi6kH3uKoACvWZA8cpoRx2eIkMFqIX", location: nil, lineup: []},
  {name: "ifbarrera", image: "http://pbs.twimg.com/profile_images/418496839508189184/8CL9_Bys_normal.jpeg", twitter_token: "27483258-N1fUrnA1MEZTrZvSGQcROaLgQkKuTzTtP4FcpRDZz", twitter_token_secret: "3IkFmlDXqtSt7vtkhv7030J4I1ZiDEtqGbplWhnu8V2ZL", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "AleksYankov", image: "http://pbs.twimg.com/profile_images/2365988716/hw9o8yc9yrfyiqbzd4ey_normal.jpeg", twitter_token: "626244513-BPj417gb4rCHhPW4HwsJwy21sAlLi6DUauILwWNl", twitter_token_secret: "a9SYlg0icZ5MysuqK3ZxzbyEugqCfeTbWtW1Ktn84VozW", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "ajkamel", image: "http://pbs.twimg.com/profile_images/479033963290189825/ZsejQsaK_normal.jpeg", twitter_token: "61245311-cd50z9TALOwtpC13B8F3GoAQO2jZEkQHIyC6h82vA", twitter_token_secret: "93fdLnrSe3Gz05mKsvEE2IFC957PierbhbICahKZvTpqF", facebook_uid: nil, facebook_token: nil, location: nil, lineup: []},
  {name: "Margaret Huang", image: "http://graph.facebook.com/10103384966062679/picture", twitter_token: nil, twitter_token_secret: nil, facebook_uid: "10103384966062679", facebook_token: "CAAHuVj8MUYgBABJccPKyCl739dDZBC0w1U3N2ueVdzDCiZB6VsjZAGYuCoNYyDN4GoC0ZAeM5QBC05QCHmOBM3gZBEuScceV6xFafciYpHNeZARBSlFZBmm7ChSwle3FkgVlNP8MKR0rDkvw9wkoijZCZBiK8GTo7R88AxB0mmZAP7bqZAPxUrR3GrYKLlJoqeoLwJeGjxTADRJxUVtTlzYV4x4", location: nil, lineup: []}
])
Trip.create!([
  {lineup: [], raver_id: 23, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 2, festival_id: 8, start_date: "07/31/2014", end_date: "08/04/2014", from_airport: nil, to_airport: "Chicago, IL"},
  {lineup: [], raver_id: 3, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 3, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 3, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 4, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 4, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 24, festival_id: 9, start_date: "03/26/2015", end_date: "03/30/2015", from_airport: nil, to_airport: "Miami, FL"},
  {lineup: [], raver_id: 25, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: "toronto", to_airport: "New York, NY"},
  {lineup: [], raver_id: 6, festival_id: 8, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 7, festival_id: 7, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 8, festival_id: 10, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 9, festival_id: 6, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 10, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 11, festival_id: 10, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 12, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 13, festival_id: 6, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 14, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 15, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 16, festival_id: 8, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 17, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 18, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 19, festival_id: 7, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 20, festival_id: 9, start_date: nil, end_date: nil, from_airport: nil, to_airport: nil},
  {lineup: [], raver_id: 26, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 27, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 27, festival_id: 7, start_date: "09/25/2014", end_date: "09/29/2014", from_airport: nil, to_airport: "Atlanta, GA"},
  {lineup: [], raver_id: 28, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 31, festival_id: 9, start_date: "03/26/2015", end_date: "03/30/2015", from_airport: nil, to_airport: "Miami, FL"},
  {lineup: [], raver_id: 32, festival_id: 8, start_date: "07/31/2014", end_date: "08/04/2014", from_airport: nil, to_airport: "Chicago, IL"},
  {lineup: [], raver_id: 33, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: ["Alesso", "Cazzette", "Dimitri Vegas &amp; Like Mike", "Dirty South", "Fedde Le Grand", "Laidback Luke", "Nervo", "Dada Life"], raver_id: 1, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: "Boston", to_airport: "New York, NY"},
  {lineup: [], raver_id: 35, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 34, festival_id: 10, start_date: "06/18/2015", end_date: "06/22/2015", from_airport: nil, to_airport: "Las Vegas, NV"},
  {lineup: [], raver_id: 36, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: [], raver_id: 36, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: ["Bassnectar", "Avicii", "Ferry Corsten"], raver_id: 21, festival_id: 7, start_date: "09/25/2014", end_date: "09/29/2014", from_airport: "LGA", to_airport: "Atlanta, GA"},
  {lineup: ["Above &amp; Beyond", "Calvin Harris", "Avicii", "Steve Aoki"], raver_id: 37, festival_id: 10, start_date: "06/18/2015", end_date: "06/22/2015", from_airport: "NYC", to_airport: "Las Vegas, NV"},
  {lineup: [], raver_id: 22, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: "LAS", to_airport: "New York, NY"},
  {lineup: ["David Guetta", "Dimitri Vegas &amp; Like Mike", "Martin Garrix", "Nervo", "Nicky Romero", "Steve Aoki", "Zedd", "Avicii"], raver_id: 1, festival_id: 7, start_date: "09/25/2014", end_date: "09/29/2014", from_airport: "NYC", to_airport: "Atlanta, GA"},
  {lineup: ["Calvin Harris", "Cash cash", "Martin Garrix", "Krewella", "Sebastian Ingrosso"], raver_id: 21, festival_id: 8, start_date: "07/31/2014", end_date: "08/04/2014", from_airport: "LGA", to_airport: "Chicago, IL"},
  {lineup: [], raver_id: 38, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"},
  {lineup: ["Above &amp; Beyond", "Alesso", "Bingo Players", "Calvin Harris", "Cedric Gervais", "Krewella", "Sebastian Ingrosso"], raver_id: 1, festival_id: 10, start_date: "06/18/2015", end_date: "06/22/2015", from_airport: "EWR", to_airport: "Las Vegas, NV"},
  {lineup: ["Above &amp; Beyond", "Avicii", "Armin Van Buuren", "Eric Prydz"], raver_id: 1, festival_id: 9, start_date: "03/26/2015", end_date: "03/30/2015", from_airport: "jfk", to_airport: "Miami, FL"},
  {lineup: [], raver_id: 37, festival_id: 6, start_date: "08/28/2014", end_date: "09/01/2014", from_airport: nil, to_airport: "New York, NY"}
])
