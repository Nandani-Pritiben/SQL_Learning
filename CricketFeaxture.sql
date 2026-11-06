 With Teams as(select 1 as Dummy,
 CASE 
 When Country='India' then 1
 when Country='Srilanka' then 2
 When Country='Bangladesh' then 3
 when Country='Japan' then 4
 when Country='South Korea' then 5
 Else 0 End as id,
 Country
 from Team)
 Select Team1.Country AS Team1,Team2.Country AS Team2
 From Teams Team1 Join Teams Team2
 on Team1.Dummy=Team2.Dummy where Team1.id<Team2.id;