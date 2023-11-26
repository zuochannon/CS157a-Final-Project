CREATE VIEW DISCOGRAPHYVIEW AS
SELECT DISTINCT
    SONGS.SONG_ID,
    SONGS.SONG_NAME,
    SONGS.RELEASE_DATE,
    ARTISTS.ARTIST_ID
FROM SONGS
JOIN SONG_ARTISTS ON SONGS.SONG_ID = SONG_ARTISTS.SONG_ID
JOIN ARTISTS ON SONG_ARTISTS.ARTIST_ID = ARTISTS.ARTIST_ID;

CREATE VIEW ARTISTMOSTPOPULARVIEW AS
SELECT DISTINCT
    SONGS.SONG_ID,
    SONGS.SONG_NAME,
    SONGS.LISTEN_COUNT,
    SONGS.RELEASE_DATE,
    ARTISTS.ARTIST_ID
FROM SONGS
JOIN SONG_ARTISTS ON SONGS.SONG_ID = SONG_ARTISTS.SONG_ID
JOIN ARTISTS ON SONG_ARTISTS.ARTIST_ID = ARTISTS.ARTIST_ID
ORDER BY LISTEN_COUNT DESC;

CREATE VIEW PLAYLISTINFOVIEW AS 
SELECT DISTINCT
    PLAYLIST_ID,     
    PLAYLIST_AUTHOR AS AUTHOR_ID, 
    PLAYLIST_NAME,   
    CREATION_DATE,   
    USERS.USERNAME AS AUTHOR_NAME
FROM
    PLAYLISTS
    JOIN USERS ON USERS.USER_ID=PLAYLIST_AUTHOR;

CREATE VIEW PLAYLISTSONGVIEW AS
SELECT DISTINCT
    PLAYLISTS.PLAYLIST_ID,
	PLAYLISTS.PLAYLIST_NAME,
    USERS.USERNAME AS PLAYLIST_AUTHOR,
    PLAYLISTS.CREATION_DATE,
    ALBUMS.ALBUM_NAME,
    SONGS.SONG_NAME,
    SONGS.LENGTH
FROM
	PLAYLISTS
JOIN USERS ON PLAYLISTS.PLAYLIST_AUTHOR = USERS.USER_ID
JOIN PLAYLIST_SONGS ON PLAYLISTS.PLAYLIST_ID = PLAYLIST_SONGS.PLAYLIST_ID
JOIN SONGS ON PLAYLIST_SONGS.SONG_ID = SONGS.SONG_ID
LEFT JOIN ALBUMS ON SONGS.ALBUM_ID = ALBUMS.ALBUM_ID;

CREATE VIEW ALBUMINFOVIEW AS 
SELECT DISTINCT
    ALBUMS.ALBUM_ID,
      ALBUMS.RELEASE_DATE,
      ALBUMS.ALBUM_NAME,
      GROUP_CONCAT(GENRES.GENRE_NAME SEPARATOR ', ') AS GENRE_NAMES,
      GROUP_CONCAT(ARTISTS.ARTIST_NAME SEPARATOR ', ') AS ARTIST_NAMES
      FROM ALBUMS 
    JOIN ALBUM_ARTISTS ON ALBUMS.ALBUM_ID = ALBUM_ARTISTS.ALBUM_ID
    JOIN ARTISTS ON ALBUM_ARTISTS.ARTIST_ID = ARTISTS.ARTIST_ID
    LEFT JOIN ALBUM_GENRES ON ALBUMS.ALBUM_ID = ALBUM_GENRES.ALBUM_ID
    LEFT JOIN GENRES ON GENRES.GENRE_ID=ALBUM_GENRES.GENRE_ID
  GROUP BY 
    ALBUMS.ALBUM_ID;

CREATE VIEW ALBUMSONGSVIEW AS
SELECT
    ALBUMS.ALBUM_ID,
    SONGS.SONG_ID,
    SONGS.SONG_NAME,
    SONGS.LISTEN_COUNT,
    SONGS.LENGTH,
    ALBUMS.RELEASE_DATE,
    GROUP_CONCAT(ARTISTS.ARTIST_NAME SEPARATOR ', ') AS ARTIST_NAMES
FROM SONGS
JOIN SONG_ARTISTS ON SONGS.SONG_ID = SONG_ARTISTS.SONG_ID
JOIN ARTISTS ON SONG_ARTISTS.ARTIST_ID = ARTISTS.ARTIST_ID
JOIN ALBUMS ON SONGS.ALBUM_ID = ALBUMS.ALBUM_ID
GROUP BY
    ALBUMS.ALBUM_ID,
    ALBUMS.ALBUM_NAME,
    SONGS.SONG_ID,
    SONGS.SONG_NAME,
    SONGS.LISTEN_COUNT,
    SONGS.LENGTH,
    ALBUMS.RELEASE_DATE;