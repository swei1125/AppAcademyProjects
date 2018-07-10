# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




user1 = User.create(username: 'User1')
user2 = User.create(username: 'User2')
user3 = User.create(username: 'User3')
user4 = User.create(username: 'User4')
user5 = User.create(username: 'User5')

art1 = Artwork.create(artist_id: user1.id, title: 'art1', image_url: 'image1.jpg')
art2 = Artwork.create(artist_id: user2.id, title: 'art2', image_url: 'image2.jpg')
art3 = Artwork.create(artist_id: user3.id, title: 'art3', image_url: 'image3.jpg')

art_share1 = ArtworkShare.create(artwork_id: art1.id, viewer_id: user4.id)
art_share2 = ArtworkShare.create(artwork_id: art2.id, viewer_id: user5.id)
art_share3 = ArtworkShare.create(artwork_id: art3.id, viewer_id: user1.id)