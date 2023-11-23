<script>
	import { onMount } from 'svelte';
	let data = [];
	
	let selectedArtist = null;
	let discography = [];
	
	
	onMount(async ()=>{
		const res = await fetch("/api/artists");
		if (!res.ok){
			return;
		}
		data = await res.json();

	})
	async function selectArtist(data){
		selectedArtist=data;
		let res = await fetch("/api/discography/"+data.ARTIST_ID);
		discography=await res.json();

	}
	function formatDate(date){
		let d = new Date(date);
		return d.toLocaleDateString('en-US', {
			month: 'long',
			day: 'numeric',
			year: 'numeric'
		});
	}

</script>

<h1>Artists:</h1>

{#each data as data (data.ARTIST_ID)}
      <button on:click = {selectArtist.bind(this,data)}>{data.ARTIST_NAME}</button>
{/each}

{#if selectedArtist != null}
	<h1>{selectedArtist.ARTIST_NAME}'s discography:</h1>
	{#each discography as song (song.SONG_ID)}
      <li>{song.SONG_NAME} | {formatDate(song.RELEASE_DATE)} | {song.LISTEN_COUNT} plays</li>
{/each}
{/if}