
INSERT INTO ARTISTS (ARTIST_NAME) VALUES
    ('John Doe'),
    ('Jane Smith'),
    ('Bob Johnson'),
    ('Josh Joshington');

INSERT INTO SONGS (SONG_NAME, LENGTH, ALBUM_ID, LISTEN_COUNT, RELEASE_DATE)
VALUES
    ('Ballad of John Doe', 200, NULL, 100, '2023-01-01'),
    ('John Doe is happy Ft Jane Smith', 180, NULL, 150, '2023-02-01'),
    ('Jane Smith Jam', 220, NULL, 120, '2023-03-01'),
    ('Jane Smith Boogie', 190, NULL, 90, '2023-04-01'),
    ('Josh Joshington Ft Bob Johnson', 210, NULL, 110, '2023-05-01');


INSERT INTO SONG_ARTISTS (SONG_ID, ARTIST_ID)
VALUES
    (1,1),
    (2,1),
    (2,2),
    (3,2),
    (4,2),
    (5,3),
    (5,4)