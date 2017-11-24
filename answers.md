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

# Stretch 1
Album.where("title ILIKE ?", "B%")

# Stretch 2
Artist.where("name ILIKE ?", "A%")

#psql

#1
SELECT title FROM albums WHERE artist_id = (SELECT id FROM artists WHERE name = 'Queen');

#2
SELECT COUNT(*) FROM tracks WHERE media_type_id = (SELECT id FROM media_types WHERE name = 'Protected MPEG-4 video file');

#3
SELECT name, unit_price FROM tracks WHERE genre_id = (SELECT id FROM genres WHERE name = 'Electronica/Dance') ORDER BY unit_price ASC LIMIT 1;

#4
SELECT name FROM artists WHERE name LIKE 'A%';

#5
SELECT name FROM tracks WHERE id = ANY (SELECT track_id FROM playlists_tracks WHERE playlist_id = 1);
