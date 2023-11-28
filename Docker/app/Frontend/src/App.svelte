<script>
	import { onMount } from "svelte";
	let artistData = [];
	let playlistData = [];
	let albumData = [];
	let genreData = [];

	let info = null;
	let discography = null;
	let album = null;
	let playlist = null;
	let mostpopular = null;

	let queryInput;
	let queryRes = null;

	const scrollTop = () => {
		window.scrollTo({
			top: 0,
			behavior: "smooth",
		});
	};

	let songCreation = {
		songName: "",
		minutes: 0,
		seconds: 0,
		listenCount: 0,
		releaseDate: null,
		albumID: 0,
		genres: [], // index of genre id
		artists: [], // index of artist id
	};
	let songCreationRes = null;

	let artistCreation = null;
	let artistCreationRes = null;

	onMount(async () => {
		fetchAll();
	});
	async function fetchAll() {
		let res = await fetch("/api/artists");
		artistData = await res.json();
		res = await fetch("/api/albums");
		albumData = await res.json();
		res = await fetch("/api/playlists");
		playlistData = await res.json();
		res = await fetch("/api/genres");
		genreData = await res.json();
	}
	function formatDate(date) {
		let d = new Date(date);
		return d.toLocaleDateString("en-US", {
			month: "long",
			day: "numeric",
			year: "numeric",
		});
	}
	function formatTime(seconds) {
		let minutes = Math.floor(seconds / 60);
		seconds = seconds % 60;
		return minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);
	}
	function deselectAll() {
		info = null;
		discography = null;
		mostpopular = null;
		playlist = null;
		album = null;
	}
	let pathstart = "";
	async function discographyView(artist) {
		scrollTop();
		deselectAll();
		info = artist;
		let res = await fetch(
			pathstart + "/api/discography/" + artist.ARTIST_ID
		);
		discography = await res.json();
		console.log(discography)
	}
	async function mostPopularView(artist) {
		scrollTop();
		deselectAll();
		info = artist;
		let res = await fetch(
			pathstart + "/api/mostpopular/" + artist.ARTIST_ID
		);
		mostpopular = await res.json();
		console.log(mostpopular)
	}
	async function albumView(albumobj) {
		scrollTop();
		deselectAll();
		info = albumobj;
		console.log(albumobj);
		let res = await fetch(pathstart + "/api/album/" + albumobj.ALBUM_ID);
		album = await res.json();
		console.log(albumView)
	}
	async function playlistView(playlistobj) {
		scrollTop();
		deselectAll();
		info = playlistobj;
		let res = await fetch(
			pathstart + "/api/playlist/" + playlistobj.PLAYLIST_ID
		);
		playlist = await res.json();
		console.log(playlist);

	}
	async function query() {
		const response = await fetch("/api/query", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({ query: queryInput }),
		});
		queryRes = await response.json();
		console.log(queryRes);
		if (!queryRes.error) {
			fetchAll();
		}
	}

	function handleAlbumChange(event) {
		songCreation.albumID = event.target.value;
	}

	function handleGenreChange(event) {
		const value = event.target.value;
		if (event.target.checked) {
			// If checkbox is checked, add to the genres array
			songCreation.genres = [...songCreation.genres, value];
		} else {
			// If checkbox is unchecked, remove from the genres array
			songCreation.genres = songCreation.genres.filter(
				(option) => option !== value
			);
		}
	}

	function handleArtistChange(event) {
		const value = event.target.value;
		if (event.target.checked) {
			// If checkbox is checked, add to the artists array
			songCreation.artists = [...songCreation.artists, value];
		} else {
			// If checkbox is unchecked, remove from the artists array
			songCreation.artists = songCreation.artists.filter(
				(option) => option !== value
			);
		}
	}

	async function addArtist() {
		const response = await fetch("/api/addartist", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({ artistInfo: artistCreation }),
		});
		artistCreationRes = await response.json();
		console.log(artistCreationRes);
		if (!artistCreationRes.error) {
			fetchAll();
		}
		queryRes = artistCreationRes;
	}

	async function addSong() {
		const response = await fetch("/api/addsong", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({ songInfo: songCreation }),
		});
		songCreationRes = await response.json();
		console.log(songCreationRes);
		if (!songCreationRes.error) {
			fetchAll();
		}
		queryRes = songCreationRes;
	}
</script>

<body>
	<div class="horizontalFlex" style="align-items: center;">
		<h1 style="margin:auto;padding:20px">MusicApp</h1>
	</div>
	<!-- FOR QUERY -->
	<div class="horizontalFlex" style="margin: 30px; align-items:center">
		<textarea
			bind:value={queryInput}
			style="width: 64vw;
		height: 10vh"
		></textarea>
		<div style="width: auto">
			<button style="height:auto;" on:click={query}>QUERY</button>
		</div>
	</div>
	{#if queryRes != null}
		<div class="horizontalFlex" style="margin: 30px;">
			{#if queryRes.error}
				<h3>
					{queryRes.error.sqlMessage}
				</h3>
			{:else if queryRes.insertId != undefined}
				<h3>
					Done. InsertID:{queryRes.insertId}
				</h3>
			{:else}
				<table>
					<thead>
						<tr>
							{#each Object.keys(queryRes[0]) as key}
								<th>
									{key}
								</th>
							{/each}
						</tr>
					</thead>
					<tbody>
						{#each queryRes as data}
							<tr>
								{#each Object.keys(queryRes[0]) as key}
									<td>{data[key]}</td>
								{/each}
							</tr>
						{/each}
					</tbody>
				</table>
			{/if}
		</div>
	{/if}
	<div class="horizontalFlex">
		<div class="panelDiv">
			<!-- ADD NEW ARTIST -->
			<div class="itemDiv">
				<h1>Add Artist</h1>
				<div style="width: 40%">
					<label for="artistName">Artist Name: </label>
					<textarea
						id="artistName"
						bind:value={artistCreation}
						style="width: 75%; height: 25px"
					></textarea>
					<button on:click={addArtist}>Add Artist</button>
				</div>
			</div>

			<!-- ADD NEW SONG -->
			<div class="itemDiv">
				<h1>Add Song</h1>
				<div class="horizontalFlex">
					<div
						style="flex: 2; margin-right: 10px; display: inline-block;"
					>
						<label for="songName">Song Name: </label>
						<textarea
							id="songName"
							bind:value={songCreation.songName}
							style="width: 100%; height: 25px"
						></textarea>
					</div>
					<div
						style="flex: 1; width: 40px; margin-right: 10px; display: inline-block;"
					>
						<label for="minutes">Minutes: </label>
						<textarea
							id="minutes"
							bind:value={songCreation.minutes}
							style="width: 100%; height: 25px"
						></textarea>
					</div>
					<div
						style="flex: 1; width: 40px; margin-right: 10px; display: inline-block;"
					>
						<label for="seconds">Seconds: </label>
						<textarea
							id="seconds"
							bind:value={songCreation.seconds}
							style="width: 100%; height: 25px"
						></textarea>
					</div>
					<div
						style="flex: 1.5; margin-right: 10px; display: inline-block;"
					>
						<label for="listenCount">Listen Count: </label>
						<textarea
							id="listenCount"
							bind:value={songCreation.listenCount}
							style="width: 100%; height: 25px"
						></textarea>
					</div>
					<div style="flex: 1; display: inline-block;">
						<label for="releaseDate">Release Date: </label>
						<input
							type="date"
							id="releaseDate"
							bind:value={songCreation.releaseDate}
							style="width: 100%;"
						/>
					</div>
				</div>
				<h3>Album:</h3>
				<div class="horizontalFlex">
					<label style="padding: 10px">
						<input
							type="radio"
							name="albumSelections"
							value={null}
							on:change={handleAlbumChange}
							bind:group={songCreation.albumID}
						/>
						None
					</label>
					{#each albumData as album}
						<label style="padding: 10px">
							<input
								type="radio"
								name="albumSelections"
								value={album.ALBUM_ID}
								on:change={handleAlbumChange}
							/>
							{album.ALBUM_NAME}
						</label>
					{/each}
				</div>
				<h3>Artists:</h3>
				<div class="horizontalFlex">
					{#each artistData as artists}
						<label style="padding: 10px">
							<input
								type="checkbox"
								value={artists.ARTIST_ID}
								on:change={handleArtistChange}
							/>
							{artists.ARTIST_NAME}
						</label>
					{/each}
				</div>
				<h3>Genres:</h3>
				<div class="horizontalFlex">
					{#each genreData as genres}
						<label style="padding: 10px">
							<input
								type="checkbox"
								value={genres.GENRE_ID}
								on:change={handleGenreChange}
							/>
							{genres.GENRE_NAME}
						</label>
					{/each}
				</div>
				<button on:click={addSong}>Add Song</button>
			</div>
			<div class="itemDiv">
				<h1>Artist Discography:</h1>
				<div class="buttonRow">
					{#each artistData as data (data.ARTIST_ID)}
						<button on:click={discographyView.bind(this, data)}
							>{data.ARTIST_NAME}</button
						>
					{/each}
				</div>
			</div>
			<div class="itemDiv">
				<h1>Artist Most Popular:</h1>
				<div class="buttonRow">
					{#each artistData as data (data.ARTIST_ID)}
						<button on:click={mostPopularView.bind(this, data)}
							>{data.ARTIST_NAME}</button
						>
					{/each}
				</div>
			</div>

			<div class="itemDiv">
				<h1>Albums:</h1>
				<div class="buttonRow">
					{#each albumData as data (data.ALBUM_ID)}
						<button on:click={albumView.bind(this, data)}
							>{data.ALBUM_NAME}</button
						>
					{/each}
				</div>
			</div>
			<div class="itemDiv">
				<h1>Playlists:</h1>
				<div class="buttonRow">
					{#each playlistData as data (data.PLAYLIST_ID)}
						<button on:click={playlistView.bind(this, data)}
							>{data.PLAYLIST_NAME}</button
						>
					{/each}
				</div>
			</div>
		</div>
		<div class="panelDiv">
			<!-- SHOW ARTIST DISCOGRAPHY -->
			{#if discography != null}
				<div class="itemDiv">
					<h1>{info.ARTIST_NAME}'s discography:</h1>
					{#each discography as song (song.SONG_ID)}
						<li>
							<i>{song.SONG_NAME}</i> | {song.ALBUM_NAME
								? song.ALBUM_NAME
								: "Single"} | {song.GENRE_NAMES} | {formatDate(
								song.RELEASE_DATE
							)}
						</li>
					{/each}
				</div>
			{/if}
			<!-- SHOW ARTIST MOST POPULAR -->
			{#if mostpopular != null}
				<div class="itemDiv">
					<h1>{info.ARTIST_NAME}'s Most Popular Songs:</h1>
					{#each mostpopular as song (song.SONG_ID)}
						<li>
							<i>{song.SONG_NAME}</i> | {song.LISTEN_COUNT} Plays |
							{formatDate(song.RELEASE_DATE)}
						</li>
					{/each}
				</div>
			{/if}
			<!-- SHOW ALL ALBUMS -->
			{#if album != null}
				<div class="itemDiv">
					<h1>{info.ALBUM_NAME}:</h1>
					<h2>By: {info.ARTIST_NAMES}</h2>
					<h3>
						Genre: {info.GENRE_NAMES ? info.GENRE_NAMES : "None"}
					</h3>
					<h3>
						Total Length: {formatTime(
							album.reduce((a, s) => {
								return a + s.LENGTH;
							}, 0)
						)}
					</h3>
					<h2>{formatDate(info.RELEASE_DATE)}</h2>
					{#each album as song}
						<li>{song.SONG_NAME} | {formatTime(song.LENGTH)}</li>
					{/each}
				</div>
			{/if}
			<!-- SHOW ALL PLAYLISTS -->
			{#if playlist != null}
				<div class="itemDiv">
					<h1>{info.PLAYLIST_NAME}:</h1>
					<h2>By: {info.AUTHOR_NAME}</h2>
					<h3>
						Total Length: {formatTime(
							playlist.reduce((a, s) => {
								return a + s.LENGTH;
							}, 0)
						)}
					</h3>
					<h2>Created: {formatDate(info.CREATION_DATE)}</h2>
					{#each playlist as song}
						<li>{song.SONG_NAME} | {formatTime(song.LENGTH)}</li>
					{/each}
				</div>
			{/if}
		</div>
	</div>
</body>

<style>
	body {
		--primary-color: #00a0ff;
		--secondary-color: #102040;
		--tertiary-color: #051020;
		--background-color: #101010;
		background-color: var(--background-color);
		height: 100vh;
		width: 100vw;
		font: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans,
			Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
	}
	.horizontalFlex {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
	}
	.itemDiv {
		background-color: var(--secondary-color);
		display: flex;
		margin: 1.25vw;
		padding: 0px 10px;
		padding-bottom: 10px;
		width: 45vw;
		height: auto;
		flex-direction: column;
	}
	.panelDiv {
		background-color: #00000000;
	}
	.buttonRow {
		flex-direction: row;
		flex-wrap: wrap;
		width: auto;
		height: auto;
	}
	button {
		color: var(--primary-color);
		background-color: var(--tertiary-color);
		border-color: var(--primary-color);
		margin: 10px;
	}
	h1 {
		color: var(--primary-color);
	}
	h2 {
		color: var(--primary-color);
		margin-top: 0px;
		margin-bottom: 5px;
	}
	h3,
	label {
		color: var(--primary-color);
		margin-top: 0px;
		margin-bottom: 5px;
	}

	li {
		color: var(--primary-color);
		margin: 0px 20px;
	}

	textarea,
	input {
		background-color: var(--secondary-color);
		border-color: var(--primary-color);
		color: var(--primary-color);
		resize: none;
	}

	table {
		color: var(--primary-color);
		border: 1px solid var(--primary-color);
	}
	th,
	td {
		border: 1px solid var(--primary-color); /* Define the border for cells */
		padding: 8px;
		text-align: left;
	}
</style>
