select genre_id, count(perfomer_id) from genreperfomer 
group by genre_id 
order by genre_id;

select count(track_name) from tracks t 
join albums a on t.album_id = a.id 
where release_year between 2019 and 2020;	

select album_id, avg(duration_sec) from tracks 
group by album_id 
order by album_id;

select distinct(name) from perfomers p 
join albumperfomer a on a.perfomer_id = p.id 
join albums a2 ON a.album_id = a2.id 
where a2.release_year != 2020;

select distinct(collection_name) from collections c 
join collectiontrack c2 on c2.collection_id = c.id 
join tracks t on c2.track_id = t.id 
join albums a on t.album_id = a.id 
join albumperfomer a2 on a2.album_id = a.id 
join perfomers p on a2.perfomer_id = p.id 
where name = 'Kizaru';

select distinct(album_name) from albums a 
join albumperfomer a2 on a2.album_id = a.id 
join perfomers p on a2.perfomer_id = p.id 
join genreperfomer g on g.perfomer_id = p.id 
join genres g2 on g.genre_id = g2.id
where p.id = (select perfomer_id from genreperfomer g 
				group by perfomer_id 
				having count(genre_id) > 1
				);
			

select track_name from tracks t 
full join collectiontrack c on c.track_id = t.id 
full join collections c2 on c.collection_id = c2.id 
where collection_name is null;

select name from tracks t 
join albums a ON t.album_id = a.id 
join albumperfomer a2 on a2.album_id = a.id 
join perfomers p on a2.perfomer_id = p.id 
where duration_sec = (select min(duration_sec) from tracks);

select a.album_name from tracks t 
join albums a on t.album_id = a.id 
group by a.album_name  
having count(track_name) = (select count(track_name) from tracks t 
							group by album_id 
							order by count(track_name)
							limit 1)