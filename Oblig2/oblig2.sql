

--Oppgave2
--a)
--imelistelinjer som er lagt inn for timeliste nummer 3:
SELECT * FROM timelistelinje WHERE timelistenr = 3

--b)
--Hvor mange timelister det er:
SELECT count(*) FROM timeliste;

--c)
--Hvor mange timelister som det ikke er utbetalt penger for:
SELECT count (*) FROM timeliste WHERE NOT status LIKE '%utbetalt%';


--d)
--Antall timelistelinjer, og antall timelistelinjer med en pauseverdi:
SELECT count(*) AS antall, count(pause) AS antallmedpause FROM timelistelinje;

--e)
--Alle timelistelinjer som ikke har pauseverdier (der pause er satt til null):
SELECT * FROM timelistelinje WHERE pause IS NULL;



--oppgave3

--a)
--Antall timer som det ikke er utbetalt penger for:
SELECT sum(varig.varighet) / 60 AS antall_ubetalt_time
FROM (SELECT v.varighet FROM timeliste AS t INNER JOIN varighet AS v
ON (t.timelistenr = v.timelistenr)
WHERE NOT t.status LIKE '%utbetalt%')AS varig;


--b)
--Hvilke timelister (nr og beskrivelse) har en timelistelinje
--med en beskrivelse som inneholder ’test’ eller ’Test’. Ikke vis duplikater:
SELECT DISTINCT tl.timelistenr , tl.beskrivelse FROM timeliste AS tl INNER JOIN
timelistelinje AS tlj ON(tl.timelistenr = tlj.timelistenr)
WHERE (tlj.beskrivelse LIKE '%Test%') OR (tlj.beskrivelse LIKE '%test%');


--C)
--Hvor mye penger som har blitt utbetalt, dersom man blir utbetalt 200 kr per time:
SELECT (sum(v.varighet) / 60) * 200 AS Utbetalt_penger_per_kr
FROM timeliste AS tl INNER JOIN varighet AS v
ON (tl.timelistenr = v.timelistenr)
WHERE tl.status LIKE '%utbetalt%';

--Oppgave (4)
--(a)
/**Det som vi får fra NATURAL JOIN spørringen er kun en rad,
det vi si at NATURAL JION fjerner alle kolonner som har likt navn
(timelistenr, beskrivelse) og så fjerner verdiene i rader som ikke er like,
derfor får vi bare timelistenr 2 med beskrivelse innføring som er helt likt
i både timeliste og timelistelinje, mens det som INNER JOIN gjør,
er egentlig kartetiskprodukt hvor relasjonene har noe i felles (fremmednøkkel),
dvs at timeliste joiner til timelistelinje hvor timeliste sitt timelistenr er
likt til timelistelinje sitt timelistenr, derfor har vi 34 rader med INNER JOIN.**/

--(b)
/**Resultatet ved å eksekvere spørringene i både NATURAL JOIN og INNER JOIN
er 34 rader. Siden det som er felles kolonne mellom relasjonene timeliste og
viewet varighet er kun timelistenr som er helt likt i timeliste sitt timelistenr
med varighet sitt timelistenr.**/
