%macro AHGfuncloop(func,loopvar=ahuige,loops=,dlm=%str( ),execute=yes,pct=1);
  %local i j cmd perccmd;
  %let j=%AHGcount(&loops,dlm=&dlm);
  %do i=1 %to &j;
  %let cmd=%sysfunc(tranwrd(&func,&loopvar,%scan(&loops,&i,&dlm)));
  %if &pct %then %let perccmd=%nrstr(%%)&cmd;
  %else %let perccmd=&cmd;
  %if &execute=yes or &execute=y %then %unquote(&perccmd);
  %else %put &perccmd;
  %end;
%mend;