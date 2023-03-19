select NameAlbum, YearAlbum from Albums
where YearAlbum = 2018;

select NameTrack, Durarion from Tracks
ORDER by Durarion desc
LIMIT 1;


select NameTrack from Tracks
where Durarion >=  3.5;

select NameCollect from collections
where YearCollect between 2018 and 2020;

select NameExecut from Executors
where not nameexecut like '%% %%';


select NameTrack from Tracks
where NameTrack like '%me%';