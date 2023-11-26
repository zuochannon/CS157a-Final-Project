
INSERT INTO ARTISTS (ARTIST_NAME) VALUES
    ('TWICE'), -- 1
    ('K/DA'), -- 2
    ('Seraphine'), -- 3
    ('(G)-IDLE'); -- 4

INSERT INTO ALBUMS (ALBUM_NAME, RELEASE_DATE)
VALUES
    ('ALL OUT', '2020-11-06'), -- 1
    ('Formula of Love: O+T=<3', '2021-11-12'), -- 2
    ('BETWEEN 1&2', '2022-08-26'), -- 3
    ('I NEVER DIE', '2022-03-14'); -- 4

INSERT INTO GENRES (GENRE_NAME) 
VALUES
    ('Disco-Pop'), -- 1
    ('Synth-Pop'), -- 2
    ('K-pop'), -- 3
    ('Pop'), -- 4
    ('Alternative Rock'), -- 5
    ('Contemporary R&B'), -- 6
    ('Hip Hop'), -- 7
    ('Dance-Pop'), -- 8
    ('Deep House'), -- 9
    ('Soul'), -- 10
    ('Ballad'), -- 11
    ('City-Pop'), -- 12
    ('Trap'), -- 13
    ('Reggae-Pop'), -- 14
    ('Bubblegum'), -- 15
    ('Pop punk'), -- 16
    ('Nu-disco'), -- 17
    ('Funk'), -- 18
    ('Atlanta bass'), -- 19
    ('House'), -- 20
    ('Future Bass'), -- 21
    ('Electro-pop'), -- 22
    ('Rock'), -- 23
    ('Soft-R&B'), -- 24
    ('Classic Rock'), -- 25
    ('EDM'), -- 26
    ('Power Ballad'), -- 27
    ('Indie-pop'), -- 28
    ('Dance'); -- 29

INSERT INTO ALBUM_ARTISTS(ALBUM_ID,ARTIST_ID) VALUES 
    (1, 2), -- K/DA on All OUT
    (1, 4), -- (G)-IDLE on ALL OUT
    (2, 1), -- TWICE on FOL
    (3, 1), -- TWICE ON B1&2
    (4, 4); -- (G)-IDLE on I NEVER DIE

INSERT INTO SONGS (SONG_NAME, LENGTH, ALBUM_ID, LISTEN_COUNT, RELEASE_DATE)
VALUES
    ('THE BADDEST', 162, 1, 185003069, '2020-08-27'), -- 1
    ('MORE', 217, 1, 218094940, '2020-10-28'), -- 2
    ('VILLAIN', 199, 1, 173026395, '2020-11-06'), -- 3
    ('DRUM GO DUM', 200, 1, 88047040, '2020-11-06'), -- 4
    ('I''LL SHOW YOU', 198, 1, 51136498, '2020-11-06'), -- 5
    ('All The Things She Said', 131, NULL, 22730009, '2020-09-25'), -- 6
    ('Childhood Dreams', 164, NULL, 13875654, '2020-09-25'), -- 7 
    ('SCIENTIST', 194, 2, 127839731, '2021-11-11'), -- 8
    ('MOONLIGHT', 219, 2, 41593771, '2021-11-12'), -- 9
    ('ICON', 176, 2, 34315362, '2021-11-12'), -- 10
    ('CRUEL', 211, 2, 21027812, '2021-11-12'), -- 11
    ('REAL YOU', 187, 2, 14474461, '2021-11-12'), -- 12
    ('F.I.L.A (Fall In Love Again)', 191, 2, 17191763, '2021-11-12'), -- 13
    ('LAST WALTZ', 170, 2, 28032446, '2021-11-12'), -- 14
    ('ESPRESSO', 187, 2, 19458863, '2021-11-12'), -- 15
    ('REWIND', 180, 2, 30664087, '2021-11-12'), -- 16
    ('CACTUS', 217, 2, 14091800, '2021-11-12'), -- 17
    ('PUSH & PULL', 205, 2, 18406951, '2021-11-12'), -- 18
    ('HELLO', 183, 2, 26261476, '2021-11-12'), -- 19
    ('1, 3, 2', 198, 2, 19901224, '2021-11-12'), -- 20
    ('CANDY', 195, 2, 15322769, '2021-11-12'), -- 21
    ('The Feels', 198, 2, 379706820, '2021-09-30'), -- 22
    ('Talk that Talk', 177, 3, 218188031,'2022-08-25'), -- 23
    ('Queen of Hearts', 186, 3, 29630807,'2022-08-26'), -- 24
    ('Basics', 176, 3, 36983308,'2022-08-26'), -- 25
    ('Trouble', 215, 3, 13126774,'2022-08-26'), -- 26
    ('Brave', 189, 3, 17164530,'2022-08-26'), -- 27
    ('Gone', 195, 3, 13183965,'2022-08-26'), -- 28
    ('When We Were Kids', 189, 3, 12621666,'2022-08-26'), -- 29
    ('TOMBOY', 174, 4, 241425409,'2022-03-14'), -- 30
    ('Never Stop me', 144, 4, 14611821,'2022-03-14'), -- 31
    ('VILLAIN DIES', 184, 4, 14768087,'2022-03-14'), -- 32
    ('ALREADY', 201, 4, 8333679,'2022-03-14'), -- 33
    ('POLAROID', 218, 4, 7094622,'2022-03-14'), -- 34
    ('ESCAPE', 209, 4, 10201722,'2022-03-14'), -- 35
    ('LIAR', 171, 4, 7737630,'2022-03-14'), -- 36
    ('MY BAG', 160, 4, 112416106,'2022-03-14'); -- 37

INSERT INTO SONG_ARTISTS (SONG_ID, ARTIST_ID)
VALUES
    -- K/DA
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),

    -- Seraphine
    (2, 3),  
    (6, 3), 
    (7, 3),

    -- TWICE
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1),
    (16, 1),
    (17, 1),
    (18, 1),
    (19, 1),
    (20, 1),
    (21, 1),
    (22, 1),
    (23, 1),
    (24, 1),
    (25, 1),
    (26, 1),
    (27, 1),
    (28, 1),
    (29, 1),

    -- (G)-IDLE
    (30, 4),
    (31, 4),
    (32, 4),
    (33, 4),
    (34, 4),
    (35, 4),
    (36, 4),
    (37, 4);



INSERT INTO SONG_GENRES(SONG_ID,GENRE_ID) VALUES
    (1,3),
    (1,13),
    (2, 3),
    (3, 4),
    (4, 3),
    (4, 29),
    (5, 4),
    (5, 11),
    (6, 28),
    (7, 4),
    (8, 18),
    (8, 20),
    (9, 17),
    (10, 14),
    (11, 20), 
    (12, 18),
    (12, 20),
    (12, 1),
    (13, 1),
    (13, 18),
    (14, 8),
    (15, 6),
    (15, 7),
    (16, 6),
    (16, 11),
    (17, 27),
    (18, 17),
    (18, 18),
    (19, 13),
    (20, 14),
    (21, 4),
    (22, 17),
    (23, 17),
    (24, 16),
    (25, 19),
    (26, 20),
    (27, 21),
    (28, 21), 
    (28, 22),
    (29, 11),
    (30, 5),
    (30, 23),
    (30, 16),
    (31, 23),
    (32, 22), 
    (33, 24),
    (33, 4),
    (34, 6),
    (35, 11),
    (36, 25),
    (37, 7),
    (37, 26);

INSERT INTO ALBUM_GENRES(ALBUM_ID,GENRE_ID) VALUES
    (1, 3),
    (2, 1),
    (2, 2),
    (3, 3),
    (3, 29),
    (3, 4),
    (3, 16),
    (4, 4),
    (4, 5),
    (4, 6),
    (4, 7);

INSERT INTO USERS (USERNAME, FIRST_NAME, LAST_NAME) 
VALUES 
    ('cuutie', 'Cutie', 'Cherry'), -- 1
    ('streamer', 'Ash', 'Ashington'), -- 2
    ('edgelord', 'Viego', 'Pentakill'); -- 3

INSERT INTO PLAYLISTS (PLAYLIST_AUTHOR, PLAYLIST_NAME, CREATION_DATE)
VALUES  
    (1, 'Current Listens', '2023-06-09'), -- 1
    (1, 'Guilty Pleasures', '2022-01-31'), -- 2
    (3, 'Work Out Tunes', '2023-07-12'), -- 3
    (2, 'Title Tracks Only!!', '2023-11-25'), -- 4
    (3, 'i miss my wife', '2010-01-30'); -- 5

INSERT INTO PLAYLIST_SONGS (PLAYLIST_ID, SONG_ID)
VALUES
    (1, 5), 
    (1, 4),
    (1, 1),
    (2, 2),
    (2, 4),
    (3, 3),
    (4, 2),
    (4, 8),
    (4, 23),
    (4, 30),
    (5, 29),
    (5, 32),
    (5, 35);