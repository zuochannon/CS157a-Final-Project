
INSERT INTO ARTISTS (ARTIST_NAME) VALUES
    ('John Doe'),
    ('Jane Smith'),
    ('Bob Johnson'),
    ('Josh Joshington');

INSERT INTO ALBUMS (ALBUM_NAME, RELEASE_DATE)
VALUES
    ('Greatest Hits of John Doe', '2023-02-01'),
    ('Josh Joshington Mixtape', '2023-05-01'),
    ('Josh and Jane Collab', '2023-05-01');

INSERT INTO GENRES (GENRE_NAME) 
VALUES
    ('Opera'),
    ('Pop')
INSERT INTO ALBUM_ARTISTS(ALBUM_ID,ARTIST_ID) VALUES 
    (1,1),
    (2,4),
    (3,2),
    (3,3);

INSERT INTO SONGS (SONG_NAME, LENGTH, ALBUM_ID, LISTEN_COUNT, RELEASE_DATE)
VALUES
    ('Ballad of John Doe', 200, 1, 100, '2023-01-01'),
    ('John Doe is happy Ft Jane Smith', 180, 1, 150, '2023-02-01'),
    ('Jane Smith Jam', 220, 3, 120, '2023-03-01'),
    ('Jane Smith Boogie', 190, 3, 90, '2023-04-01'),
    ('Josh Joshington Ft Bob Johnson', 210, 2, 110, '2023-05-01'),
    ('Josh Joshington Single', 210, NULL, 110, '2023-05-01'),
    ('Jane Johnson Bob Smith',45,3,5,'2023-08-15');

INSERT INTO SONG_ARTISTS (SONG_ID, ARTIST_ID)
VALUES
    (1,1),
    (2,1),
    (2,2),
    (3,2),
    (4,2),
    (5,3),
    (5,4);

INSERT INTO SONG_GENRES(SONG_ID,GENRE_ID) VALUES
    (1,1),
    (2,2)
INSERT INTO ALBUM_GENRES(ALBUM_ID,GENRE_ID) VALUES
    (1,1),
    (1,2),
INSERT INTO USERS (USERNAME, FIRST_NAME, LAST_NAME) 
VALUES 
    ('cuutie', 'Cutie', 'Cherry'),
    ('streamer', 'Ash', 'Ashington'),
    ('edgelord', 'Viego', 'Pentakill');

INSERT INTO PLAYLISTS (PLAYLIST_AUTHOR, PLAYLIST_NAME, CREATION_DATE)
VALUES  
    (1, 'Current Listens', '2023-06-09'),
    (1, 'Guilty Pleasures', '2022-01-31'),
    (3, 'Work Out Tunes', '2023-07-12');

INSERT INTO PLAYLIST_SONGS (PLAYLIST_ID, SONG_ID)
VALUES
    (1, 5),
    (1, 4),
    (1, 1),
    (2, 2),
    (2, 4),
    (3, 3);