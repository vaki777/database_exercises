/* create database biblioteka
CREATE DATABASE biblioteka;

/* create table oblast
CREATE TABLE oblast(
  sifo varchar(2) NOT NULL PRIMARY KEY,
  naziv varchar(30) NOT NULL UNIQUE
);

/* insert into oblast
INSERT INTO oblast(sifo, naziv) VALUES ('BP', 'Baze podataka');
INSERT INTO oblast(sifo, naziv) VALUES('RM', 'Racunarske mreze');
INSERT INTO oblast(sifo, naziv) VALUES ('PJ', 'Programski jezici');

/* create table naslov
CREATE TABLE naslov(
  sifn varchar(4) NOT NULL PRIMARY KEY,
  naziv varchar(30) NOT NULL,
  sifo varchar(2) REFERENCES oblast(sifo)
);

/* insert into naslov
INSERT INTO naslov(sifn, naziv, sifo) VALUES ('RBP0', 'Relacione baze podataka', 'BP');
INSERT INTO naslov(sifn, naziv, sifo) VALUES ('RK00', 'Racunarske komunikacije', 'RM');
INSERT INTO naslov(sifn, naziv, sifo) VALUES ('PP00', 'Pascal programiranje', 'PJ');
INSERT INTO naslov(sifn, naziv, sifo) VALUES ('PJC0', 'Programski jezik C', 'PJ');

/*create table autor
CREATE TABLE autor(
  sifa varchar(3) NOT NULL PRIMARY KEY,
  ime varchar(20) NOT NULL
);

/* insert into autor
INSERT INTO autor(sifa, ime) VALUES ('AP0', 'A. Popovic');
INSERT INTO autor(sifa, ime) VALUES ('IT0', 'I. Todorovic');
INSERT INTO autor(sifa, ime) VALUES ('AP1', 'A. Petrovic');
INSERT INTO autor(sifa, ime) VALUES ('JN0', 'J. Nikolic');
INSERT INTO autor(sifa, ime) VALUES ('DM0', 'D. Markovic');
INSERT INTO autor(sifa, ime) VALUES ('ZP0', 'Z. Petrovic');

/* create table je_autor
CREATE TABLE je_autor(
  sifa varchar(3) REFERENCES autor(sifa),
  sifn varchar(4) REFERENCES naslov(sifn),
  koji integer NOT NULL,
CONSTRAINT je_autor_pkey PRIMARY KEY (sifa, sifn)
);

/* insert into je_autor - N:N relation between tables naslov and autor
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('AP0','RBP0', 1);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('JN0','RBP0', 2);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('DM0','RK00', 1);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('ZP0','PP00', 1);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('DM0','PP00', 2);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('AP1','PJC0', 1);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('IT0','PP00', 3);
INSERT INTO je_autor(sifa, sifn, koji) VALUES ('ZP0','PJC0', 2);

/* create table knjiga
CREATE TABLE knjiga(
  sifk varchar(3) NOT NULL PRIMARY KEY,
  sifn varchar(4) REFERENCES naslov(sifn)
);

/* insert into knjiga
INSERT INTO knjiga(sifk, sifn) VALUES ('001', 'RBP0');
INSERT INTO knjiga(sifk, sifn) VALUES ('002', 'RBP0');
INSERT INTO knjiga(sifk, sifn) VALUES ('003', 'RK00');
INSERT INTO knjiga(sifk, sifn) VALUES ('004', 'PJC0');
INSERT INTO knjiga(sifk, sifn) VALUES ('005', 'PJC0');
INSERT INTO knjiga(sifk, sifn) VALUES ('006', 'PJC0');
INSERT INTO knjiga(sifk, sifn) VALUES ('007', 'PP00');
INSERT INTO knjiga(sifk, sifn) VALUES ('008', 'PP00');
INSERT INTO knjiga(sifk, sifn) VALUES ('009', 'PP00');

/* create table clan
CREATE TABLE clan(
  sifc varchar(3) NOT NULL PRIMARY KEY,
  ime varchar(30) NOT NULL
);

/* insert into clan
INSERT INTO clan(sifc, ime) VALUES ('JJ0', 'J. Jankovic');
INSERT INTO clan(sifc, ime) VALUES ('PP0', 'P. Petrovic');
INSERT INTO clan(sifc, ime) VALUES ('JJ1', 'J. Jovanovic');
INSERT INTO clan(sifc, ime) VALUES ('MM0', 'M. Markovic');

/* create table pozajmica
CREATE TABLE pozajmica(
  sifp BIGSERIAL NOT NULL PRIMARY KEY,
  sifc varchar(3) REFERENCES clan(sifc),
  sifk varchar(3) REFERENCES knjiga(sifk),
  dana integer
);

/* insert into pozajmica
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('JJ0', '004', 5);
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('PP0', '007', 2);
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('JJ1', '005', 6);
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('JJ0', '008', 7);
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('PP0', '002', 4);
INSERT INTO pozajmica(sifc, sifk, dana) VALUES ('JJ1', '009', 3);

/* create table rezervacija - N:N relation between tables naslov and clan
CREATE TABLE rezervacija(
  sifn varchar(4) REFERENCES naslov(sifn),
  sifc varchar(3) REFERENCES clan(sifc),
  datum DATE NOT NULL,
CONSTRAINT rezervacija_pkey PRIMARY KEY (sifn, sifc)
);

/* insert into rezervacija
INSERT INTO rezervacija(sifn, sifc, datum) VALUES ('RBP0', 'JJ1', DATE('1995-10-18'));
INSERT INTO rezervacija(sifn, sifc, datum) VALUES ('RBP0', 'MM0', DATE('1995-10-20'));

/*************************************************************************************

/* upit za prikaz tabele oblast
select * from oblast;

/* upit za prikaz tabele oblast u zeljenom redosledu
select * from oblast
order by sifo;

/* upit za prikaz kolone sifn iz tabele knjiga
select sifn from knjiga;

/* upit za prikaz kolone sifn iz tabele knjiga sa eleminacijom duplikata
select distinct sifn from knjiga;

/* upit za prikaz kolone sifn iz tabele knjiga sa eleminacijom duplikata u zeljnom redosledu
select distinct sifn from knjiga
order by sifn desc;

/* upit za prikaz dve kolone iy tabele naslov sa zadatom oblascu
select sifn, naziv from naslov 
where sifo='PJ';

/* upit za prikaz ukupnog broja clanova
select count(*) from clan;

/* upit za prikaz broja clanova koji su vrsili pozajmice
select count(distinct sifc) from pozajmica;

/* upit za prikaz broja naslova koje je napisao zadati autor
select count(*) from je_autor
WHERE sifa = 'DM0';

/* upit za prikaz sume trajanja svih pozajmica
select SUM(dana) from pozajmica;

/* upit za prikaz min i max trajanja svih pozajmica
select MIN(dana) AS minimalno, MAX(dana) AS naksimalno from pozajmica;

/* upit za prikaz sume i proseka trajanja pozajmica za zadatog clana
select SUM(dana), AVG(dana) from pozajmica 
WHERE sifc = 'JJ1';

/* upit za prikaz sifara autora i broja naslova koji su napisali
select sifa, count(*) 
from je_autor
group by sifa;

/* upit za prikaz sifara clanova i sumu njihovih pozajmica
select sifc, SUM(dana) 
from pozajmica
group by sifc;

/* upit za prikaz sifara clanova cija je suma trajanja pozajmica >10
select sifc, SUM(dana) 
from pozajmica
group by sifc
having sum(dana) > 10;

/* upit za prikaz sifara clanova, njihovog ukupnog broja pozajmica i ukupnog trajanja pozajmica
select sifc, count(*), sum(dana)
from pozajmica
group by sifc;

/* upit za prikaz sifara clanova, njihovog ukupnog broja pozajmica i ukupnog trajanja pozajmica ali samo za pozajmice duze od 2 dana
select sifc, count(*), sum(dana)
from pozajmica
where dana >2
group by sifc;

/* upit koji daje nazive naslova i nazive njihove oblasti
select naslov.naziv, oblast.naziv
from naslov join oblast
on naslov.sifo=oblast.sifo;

/* upit koji daje nazive naslova i nazive njihove oblasti sortirano po nazivu naslova
select naslov.naziv, oblast.naziv
from naslov join oblast
on naslov.sifo=oblast.sifo
order by naslov.naziv;

/* upit koji daje sifre i imena clanova koji su pozajmljivali knjige
select distinct clan.sifc, clan.ime
from clan join pozajmica
on clan.sifc=pozajmica.sifc;

/* upit koji daje ukupno trajanje pozajmica svih knjiga sa sifrom naslova PP00
select sum(pozajmica.dana)
from knjiga join pozajmica
on knjiga.sifk=pozajmica.sifk
where knjiga.sifn='PP00';

/* upit koji daje sifre, imena clanova i broj njihovih pozajmica
select clan.sifc, clan.ime, count(*)
from clan join pozajmica
on clan.sifc=pozajmica.sifc
group by clan.sifc, clan.ime;

/* upit koji daje sifre clanova i ukupna trajanja pozajmice ali samo one koje su izmedju 5 i 10 dana
select sifc, sum(dana)
from pozajmica 
group by sifc
having sum(dana) between 5 and 10;

/* upit koji daje nazive svih naslova u kojima se nalazi jec jezik
select naziv
from naslov
where naziv like '%jezik%';

/* upit koji daje sifre knjiga koje odgovaraju naslovima sifara RBP0 i RK00
select sifk
from knjiga 
where sifn in ('RBP0', 'RK00');

/* upit koji daje sifre naslova za sve knjige osim za one cije su sifre 001, 002 i 003
select distinct sifn
from knjiga
where sifk not in ('001', '002', '003');

