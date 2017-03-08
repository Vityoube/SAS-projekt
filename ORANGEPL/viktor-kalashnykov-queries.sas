
ods title "Srednie notowania za rok 2008";

proc means data=GPW.ORANGEPL2008;
by rok miesiac;
var Zamkniecie;
run;
libname GPW 'C:\ORANGEPL\GPW';
run;

proc import out=GPW.SP
file='C:\ORANGEPL\GPW\ORANGEPL.xls' 
dbms=xls 
replace;
run; 
data GPW.ORANGEPL; 
set GPW.SP(keep=Data Zamkniecie ) ; 
tydzien=week(input(Data,yymmdd10.));
miesiac=month(input(Data,yymmdd10.));
rok=year(input(Data,yymmdd10.)); 
run;

data GPW.ORANGEPL2008;
    set GPW.ORANGEPL();
    where rok=2008;
run;
data GPW.ORANGEPL2009;
    set GPW.ORANGEPL();
    where rok=2009;
run;
data GPW.ORANGEPL2010;
    set GPW.ORANGEPL();
    where rok=2010;
run;
data GPW.ORANGEPL2011;
    set GPW.ORANGEPL();
    where rok=2011;
run;
data GPW.ORANGEPL2012;
    set GPW.ORANGEPL();
    where rok=2012;
run;

data GPW.ORANGEPL2013;
    set GPW.ORANGEPL();
    where rok=2013;
run;

data GPW.ORANGEPL2014;
    set GPW.ORANGEPL();
    where rok=2014;
run;

data GPW.ORANGEPL2015;
    set GPW.ORANGEPL();
    where rok=2015;
run;

data GPW.ORANGEPL2016;
    set GPW.ORANGEPL();
    where rok=2016;
run;

proc export data=GPW.SP
outtable="Sheet0"
dbms=access
replace;
database="C:\ORANGEPL\GPW1\ORANGEPL.mdb";
run;

libname GPW1 access 'C:\ORANGEPL\GPW1\ORANGEPL.mdb';
run;

data GPW1.zbior0;
set GPW.ORANGEPL2008;
run;
data GPW1.zbior1;
set GPW.ORANGEPL2009;
run;
data GPW1.zbior2;
set GPW.ORANGEPL2010;
run;
data GPW1.zbior3;
set GPW.ORANGEPL2011;
run;
data GPW1.zbior4;
set GPW.ORANGEPL2012;
run;
data GPW1.zbior5;
set GPW.ORANGEPL2013;
run;
data GPW1.zbior6;
set GPW.ORANGEPL2014;
run;
data GPW1.zbior7;
set GPW.ORANGEPL2015;
run;
data GPW1.zbior8;
set GPW.ORANGEPL2016;
run;

proc export data=GPW.ORANGEPL2008
file='C:\ORANGEPL\GPW\ORANGEPL2008.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2009
file='C:\ORANGEPL\GPW\ORANGEPL2009.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2010
file='C:\ORANGEPL\GPW\ORANGEPL2010.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2011
file='C:\ORANGEPL\GPW\ORANGEPL2011.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2012
file='C:\ORANGEPL\GPW\ORANGEPL2012.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2013
file='C:\ORANGEPL\GPW\ORANGEPL2013.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2014
file='C:\ORANGEPL\GPW\ORANGEPL2014.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2015
file='C:\ORANGEPL\GPW\ORANGEPL2015.xls'
dbms=tab replace;
run;

proc export data=GPW.ORANGEPL2016
file='C:\ORANGEPL\GPW\ORANGEPL2016.xls'
dbms=tab replace;
run;

ods title "Srednie notowania za rok 2008"; 

proc means data=GPW.ORANGEPL2008;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2009"; 

proc means data=GPW.ORANGEPL2009;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2010";
 
proc means data=GPW.ORANGEPL2010;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2011";
 
proc means data=GPW.ORANGEPL2011;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2012"; 

proc means data=GPW.ORANGEPL2012;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2013"; 

proc means data=GPW.ORANGEPL2013;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2014"; 

proc means data=GPW.ORANGEPL2014;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2015"; 

proc means data=GPW.ORANGEPL2015;
by rok miesiac;
var Zamkniecie; 
run;

ods title "Srednie notowania za rok 2016"; 
proc means data=GPW.ORANGEPL2016;
by rok miesiac;
var Zamkniecie; 
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2008; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2008 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2009; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2009 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2010; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2010 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2011; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2011 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2012; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2012 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2013; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2013 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2014; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2014 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2015; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2015 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

data GPW.ORANGEPLstopazwrotuiprzyrosty2016; 
  retain kursPoczatkowy;
  retain kursKoncowy;

  set GPW.ORANGEPL2016 end=eof curobs=observ1;
  
  if observ1 = 1 then do;
	kursPoczatkowy = Zamkniecie;
  end;
  if eof then do;
	kursKoncowy = Zamkniecie;
	stopaZwrotu = (kursKoncowy - kursPoczatkowy)/100;
  end; 
  przyrostAbsolutny = Zamkniecie - kursPoczatkowy;
  przyrostWzgledny = (Zamkniecie - kursPoczatkowy)/kursPoczatkowy;  
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2008 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2008;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2009 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2009;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2010 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2010;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2011 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2011;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2012 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2012;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2013 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2013;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2014 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2014;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2015 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2015;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

goptions reset=all htitle=12pt htext=10pt;
title "Wykres notowan dla 2016 roku";
axis1 label=("Dni w roku") minor=(n=14);
axis2 label=(angle=90 "Kurs") minor=(n=14);
symbol interpol=join height=100;
proc gplot data=GPW.ORANGEPL2016;
plot Zamkniecie*Data / haxis=axis1 vaxis=axis2;
run;

ods title "Ceny tygodniowe za rok 2008"; 
proc means data=GPW.ORANGEPL2008; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2009"; 
proc means data=GPW.ORANGEPL2009; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2010"; 
proc means data=GPW.ORANGEPL2010; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2011"; 
proc means data=GPW.ORANGEPL201; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2012"; 
proc means data=GPW.ORANGEPL2012; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2013"; 
proc means data=GPW.ORANGEPL2013; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2014"; 
proc means data=GPW.ORANGEPL2014; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2015"; 
proc means data=GPW.ORANGEPL2015; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe za rok 2016"; 
proc means data=GPW.ORANGEPL2016; 
by rok miesiac tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny tygodniowe "; 
proc means data=GPW.ORANGEPL; 
by rok tydzien;
var Zamkniecie;
output out = GPW.SAS; 
run;

ods title "Ceny dzienne "; 
proc means data=GPW.ORANGEPL; 
by rok tydzien data;
var Zamkniecie;
output out = GPW.SAS1; 
run;

data GPW.S; 
set GPW.SAS(keep=rok tydzien Zamkniecie _STAT_) ; 
where _STAT_='MEAN';
set GPW.dates;
run;

data GPW.S1; 
set GPW.SAS1(keep=rok data Zamkniecie _STAT_) ; 
where _STAT_='MEAN';
run;
