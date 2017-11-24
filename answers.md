# 1
Album.where(artist_id: Artist.find_by(name: "Queen").id)

#2
Track.where(media_type_id: MediaType.find_by(name: "Protected MPEG-4 video file")).count

#3
Genre.find_by(name: "Hip Hop/Rap")

#4
Track.where(genre_id: Genre.find_by(name: "Hip Hop/Rap")).count

#5
Track.sum(:milliseconds)

#6
Track.where(media_type_id: MediaType.find_by(name: "MPEG audio file").id).maximum(:unit_price)

#7
Track.find_by(unit_price: Track.where(media_type_id: MediaType.find_by(name: "MPEG audio file").id).maximum(:unit_price)).name

#8
Artist.order(created_at: :asc).limit(2)

#9
Track.where(genre_id: Genre.find_by(name: "Electronica/Dance").id).find_by(unit_price: Track.minimum(:unit_price))

# 10
Track.where(genre_id: Genre.find_by(name: "Electronica/Dance").id).where(media_type_id: MediaType.find_by(name: "MPEG audio file").id)
