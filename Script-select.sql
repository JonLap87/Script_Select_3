select NameAlbum, YearAlbum from Albums
where YearAlbum = '2018-01-07';

select NameTrack, Durarion from Tracks
where Durarion = 5;

select NameTrack from Tracks
where Durarion >  3.4;

select NameCollect from Collections
where YearCollect between '2018-04-04' and '2020-01-09';

select NameExecut from Executors
where NameExecut = 'D';

select NameTrack from Tracks
where NameTrack like '%me%';