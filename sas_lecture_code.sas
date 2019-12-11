proc import 
  datafile='/home/ken/test1.csv'
  dbms=csv
  out=mydata
  replace;
  getnames=yes;
proc print;
proc means;      
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/global.csv";

proc import 
  datafile=myurl 
  dbms=csv
  out=global
  replace;
  getnames=yes;
  
proc print;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/coffee.txt";      
proc import 
  datafile=myurl
  dbms=dlm
  out=coffee
  replace;
  delimiter=' ';
  getnames=yes;
proc print data=coffee(obs=15);      
filename myurl 
 url 
 "http://www.utsc.utoronto.ca/~butler/c32/soap.txt";

proc import 
  datafile=myurl 
  dbms=dlm
  out=soap
  replace;
  delimiter=' ';
  getnames=yes;
  
proc print data=soap(obs=10);

proc import 
  datafile='/home/ken/test2.xlsx'
  dbms=xlsx
  out=mydata
  replace;
  sheet=data;
  getnames=yes;
proc print;    
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";
proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;

proc print data=sports(obs=9);
proc means;    
proc sgplot;
  vbar Sport;
proc sgplot;
  histogram BMI;
proc sgplot;
  vbar Sport / group=Sex groupdisplay=cluster;
proc sgplot;
  vbox BMI / category=Sex;
proc sgplot;
  scatter x=Ht y=Wt;
proc sgplot;
  scatter x=Ht y=Wt;
  reg x=Ht y=Wt;
proc sgplot;
  vbox BMI / group=Sex category=Sport;
proc sgplot;
  scatter x=Ht y=Wt / group=Sex;
proc sgpanel;
  panelby Sport;
  scatter x=Ht y=Wt / group=Sex;
data ath;
  set sports;
proc means Q1 Q3 Qrange;
  var Wt;
proc means mean stddev;
  var Ht;
  class Sex;
proc means n;
  var BMI;
  class Sport;
proc freq;
  tables Sport;
proc means stddev;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/jays15-home.csv";
proc import
  datafile=myurl
    dbms=csv
    out=jays
    replace;
  getnames=yes;
proc print data=jays(obs=6);      
proc ttest h0=29327;
  var attendance;
  proc sgplot;
    vbox attendance / category=daynight;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/drp.txt";  
proc import
  datafile=myurl
  dbms=dlm
  out=reading
  replace;
  delimiter=' ';
  getnames=yes;
  proc print;
  proc means;
    class group;
    var score;
  proc sgplot;
    vbox score / category=group;
  proc ttest side=L;
    var score;
    class group;
proc power;
  onesamplemeans
  test=t
  nullmean=10
  mean=8
  stddev=4
  ntotal=15
  power=.;
proc power;
  onesamplemeans
  test=t
  nullmean=10
  mean=8
  stddev=4
  ntotal=.
  power=0.80;
  proc power plotonly;
    onesamplemeans
      test=t
      nullmean=10
      mean=8
      stddev=4
      ntotal=15
      power=.;    
    plot x=n min=15 max=80;
  proc power plotonly;
    onesamplemeans
      test=t
      nullmean=10
      mean=8
      stddev=4
      ntotal=15 34
      power=.;
    plot x=effect min=5 max=10;    
proc means;
  var score;
  class group;
  proc power plotonly;
    twosamplemeans
      test=diff_satt
      sides=1
      meandiff=5 10
      stddev=15
      ntotal=44
      power=.;
    plot x=n min=10 max=300;
  proc power;
  twosamplemeans
    test=diff_satt
    sides=1
    meandiff=5
    groupstddevs=11|17
    groupns=21|23
    power=.;
  proc power;
  twosamplemeans
    test=diff_satt
    sides=1
    meandiff=5
    stddev=15
    groupns=10|34
    power=.;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/duality.txt";    
proc import
  datafile=myurl
    dbms=dlm
    out=duality
    replace;
  delimiter=' ';
  getnames=yes;
proc print;
    proc ttest;
      var y;
      class group;
    proc ttest alpha=0.10;
      var y;
      class group;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/irs.txt";    
proc import
  datafile=myurl
    dbms=csv
    out=irs
    replace;
  getnames=yes;
proc print;    
proc ttest h0=160 sides=U;
  var Time;
proc sgplot;
  histogram Time;
proc univariate location=160;
  var Time;
proc sgplot;
  vbox Time;
proc univariate cipctldf;
  var Time;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/analgesic.txt";  
proc import
  datafile=myurl
    dbms=dlm
    out=pain
    replace;
  delimiter=' ';
  getnames=yes;
proc print;    
proc ttest;
  paired druga*drugb;
data pain2;
  set pain;
  diff=druga-drugb;  
proc print;    
  proc ttest h0=0;
    var diff;
  proc univariate noprint;
    qqplot diff;
  proc univariate noprint;
    qqplot diff / normal(mu=est sigma=est);
  proc univariate noprint;
    qqplot diff / normal(mu=-1.65 sigma=1.455);
proc univariate;
  var diff;  
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/drp.txt";    
proc import
  datafile=myurl
  dbms=dlm
  out=reading
  replace;
  delimiter=' ';
  getnames=yes;
  proc print;
proc npar1way median;
  var score;
  class group;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/jumping.txt";  
proc import
  datafile=myurl
    dbms=dlm
    out=rats
    replace;
  delimiter=' ';
  getnames=yes;
proc anova;
  class group;
  model density=group;
proc anova;
  class group;
  model density=group;
  means group / tukey;
proc npar1way median;
  var density;
  class group;
proc anova;
  class group;
  model density=group;
  means group / hovtest=levene welch;
proc mixed;
  class group;
  model density=group / ddfm=satterth;
  repeated / group=group;
  lsmeans group / adjust=tukey adjdfe=row;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";
proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;

proc print data=sports(obs=10);    
data sports2;
  set sports;
  keep Sport Sex Ht Wt;
proc print data=sports2(obs=8);
data sports3;
  set sports;
  drop RCC--LBM;
    proc print data=sports3(obs=8);
data sports4;
  set sports;
  Wt_lb=Wt*2.2;
  keep Sport Wt Wt_lb;
proc print data=sports4(obs=7);    
data sports5;
  set sports;
  if _N_>=16 and _N_<=25;
proc print;  
data sports6;
  set sports;
  if _N_ in (10, 13, 17, 42);
proc print;    
data sports7;
  set sports;
  if Sport="Tennis";
proc print;    
data sports8;
  set sports;
  if Sport="Tennis" and RCC<5;
proc print;
  var Sex--RCC;
data sports9;
  set sports;
  if Sport="Tennis" or RCC>5;
proc print;
  var Sex--RCC BMI;
proc means;
  where sport="Tennis";
  var BMI;
proc sort data=sports;
  by RCC;
  
proc print;  
  var Sex--RCC;
proc sort data=sports;
  by RCC BMI;
  
proc print;  
  var Sex--RCC BMI;
proc sort data=sports;
  by descending BMI;
  
proc print;  
  var Sex--RCC BMI;
proc sort data=sports;
  by descending Wt;
  
data sports10;
  set sports;
  if _N_<=7;
  keep Sport Wt;
  
proc print;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs1.txt";      
proc import 
  datafile=myurl
  dbms=dlm out=pigs replace;
  delimiter=' ';
  getnames=yes;
proc print;      
data pigs2;
  set pigs;
  feed='feed1';
  weight=feed1;
  output;
  feed='feed2';
  weight=feed2;
  output;
  feed='feed3';
  weight=feed3;
  output;
  feed='feed4';
  weight=feed4;
  output;
  keep feed weight;
proc print;    
data pigs3;
  set pigs;
  array feed_array [4] feed1-feed4;
  do i=1 to 4;
    weight=feed_array[i];
    feed=vname(feed_array[i]);
    output;
  end;
  keep pig feed weight;
proc print;    
proc anova;
  class feed;
  model weight=feed;
  means feed / tukey;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/global.csv";
proc import
    datafile=myurl
    dbms=dlm
    out=util
    replace;
    delimiter=' ';
    getnames=yes;
proc print data=util(obs=8);    
proc sgplot;
  scatter x=usage y=demand;
proc reg;
  model demand=usage;      
proc transreg;
  model boxcox(demand)=identity(usage);        
data trans;
  set util;
  rtdemand=sqrt(demand);        
proc sgplot;
  scatter x=usage y=rtdemand;
proc reg;
  model rtdemand=usage;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs.txt";
proc import
  datafile=myurl
  out=pigs
  dbms=dlm
  replace;
  getnames=yes;
  delimiter=' ';
  
proc print;
proc glm;
  class feed;
  model weight=feed / solution;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/crickets2.csv";      
proc import
  datafile=myurl
  out=crickets
  dbms=csv
  replace;
  getnames=yes;
  
proc print data=crickets(obs=20);
proc glm;
  class species;
  model pulse_rate=temperature species / solution;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/mydates.csv";
proc import
  datafile=myurl
    dbms=csv
    out=dates
    replace;
  getnames=yes;
proc print;
proc print;
  format date mmddyy8.;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pieces.txt";
proc import
  datafile=myurl
    dbms=dlm
    out=pieces
    replace;
  delimiter=' ';
  getnames=yes;
  
data makedates;
  set pieces;
  sasdate=mdy(month,day,year);
proc print;
  format sasdate yymmdd10.;
proc print;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/monthly.csv";
proc import
  datafile=myurl
  out=sales1
  dbms=csv
  replace;
  getnames=yes;
  
proc print;  
data sales2;
  set sales1;
  date_text=cat('16 ',month,' ',year);
  real_date=input(date_text,anydtdte20.);
  
proc print;  
  var sales date_text real_date;
  format real_date yymmdd10.;
proc sgplot;
  series x=real_date y=sales / markers;
  format real_date monyy7.;
proc print data=dates;
data moredates;
  set dates;
  d=day(date);
  m=month(date);
  y=year(date);
proc print;  
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/dt.csv";  
proc import
  datafile=myurl
    dbms=csv
    out=dt
    replace;
  getnames=yes;
proc print;  
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/manypieces.txt";      
proc import
  datafile=myurl
    dbms=dlm
    out=many
    replace;
  delimiter=' ';
  getnames=yes;
data dtm;
  set many;
  thedate=mdy(month,day,year);
  sasdt=dhms(thedate,hour,minute,second); 
  keep thedate hour minute second sasdt;      
proc print;    
proc print;    
format thedate yymmdd10. thetime time8. 
  sasdt datetime.;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/hospital.csv";  
proc import
  datafile=myurl
    dbms=csv
    out=stays
    replace;
  getnames=yes;
data hospitalstay;
  set stays;
  stay=(discharge-admit)/60/60/24;
proc print;          
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/many.txt";
proc import
  datafile=myurl
    dbms=dlm out=many replace;
  delimiter=' ';
  getnames=no;
proc print;    
data one;
  set many;
  array x_array VAR1-VAR6;
  do i=1 to 6;
    x=x_array[i];
    output;
  end;
  keep x;
proc print;      
data two;
  set many;
  array xy_array VAR1-VAR6;
  do i=1 to 3;
    x=xy_array[2*i-1];
    y=xy_array[2*i];
    output;
  end;
  keep x y;
proc print;    
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/pigs1.txt";  
libname mydata V9 '/home/ken';
proc import
  datafile=myurl
    dbms=dlm 
    out=mydata.pigs1
    replace;
  delimiter=' ';
  getnames=yes;
proc means data='/home/ken/pigs1';      
proc print data=two;      
libname mydata V9 '/home/ken';    
data mydata.three; /* permanent data set to save in */
  set two; /* this has variables x and y in it */
  z=x+y;
proc print data='/home/ken/three';
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/ais.txt";      
proc import 
  datafile=myurl
  dbms=dlm
  out=sports
  replace;
  delimiter='09'x;
  getnames=yes;
proc sgplot;
  histogram Ht;
  density Ht / type=kernel;
proc sgplot;
  histogram BMI;
  density BMI / type=kernel;
proc sgplot;
  scatter x=Ht y=Wt;
  loess x=Ht y=Wt;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/windmill.csv";    
proc import
  datafile=myurl
    dbms=csv
    out=windmill
    replace;
  getnames=yes;
proc means;    
proc sgplot;
  scatter x=wind_velocity y=DC_output;
  loess x=wind_velocity y=DC_output;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/oranges.txt";      
proc import
  datafile=myurl
    dbms=dlm
    out=trees
    replace;
  delimiter=' ';
  getnames=yes;
proc print;    
proc sgplot;
  series x=age y=a / markers;
  series x=age y=b / markers;
  series x=age y=c / markers;
  series x=age y=d / markers;
  series x=age y=e / markers;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/cars.csv";      
proc import 
  datafile=myurl
  dbms=csv
  out=cars
  replace;
  getnames=yes;
proc sgplot;
  scatter y=mpg x=weight / datalabel=car;
proc sgplot;
  scatter x=weight y=mpg / datalabel=country;
data cars2;
  set cars;
  if (_n_=4 or _n_=9) then do;
    newtext=car;
  end;
proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;
data cars3;
  set cars;
  if mpg>34 then do;
     newtext=car;
  end;
    
proc sgplot;
  scatter x=weight y=mpg / datalabel=newtext;
proc iml;
  k=2;
  u={2 3 6 5 7};
  ans=k+u;
  print ans;
proc iml;
  u={2 3 6 5 7};
  v={1 8 3 4 2};
  ans=u+v;
  print ans;
proc iml;
  k=2;
  u={2 3 6 5 7};
  ans=k*u;
  print ans;
proc iml;
  A={1 3,2 4};
  B={5 6,7 8};
  print A;
  print B;
proc iml;
  A={1 3,2 4};
  B={5 6,7 8};
  ans1=A+B; 
  print ans1;
  ans2=A*B;
  print ans2;
filename myurl url 
  "http://www.utsc.utoronto.ca/~butler/c32/m.txt";
proc import
  datafile=myurl
    dbms=dlm
    out=mymatrix
    replace;
  delimiter=' ';
  getnames=no; 
proc iml;
  use mymatrix;
  read all var {VAR1 VAR2} into M;
  v={1,3};
  ans=M*v;
  print ans;
proc iml;
  A={1 3,2 4};
  w={1,2};
  Ainv=inv(A);
  print Ainv;
  ans=Ainv*w;
  print ans;
proc iml;
  r={1 2 3};
  c={4,5,6};
  print r;
  print c;
proc iml;
  a={1,2,3};
  b={4,5,6};
  ans=t(a)*b;
  print ans;
