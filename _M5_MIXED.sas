



/* Define your input path */
/* overwrite 'E:\_dPdT_work\_2021\_first_attempts' with your local path */

%let _DTAS='E:\_dPdT_work\_2021\_first_attempts\T_econ.dta';


/* DTAS data imported */
proc import datafile=&_DTAS
    out=s1(where=(dlgdp_pc_usd ne . and T5_varm ne .))
    dbms=dta
    replace;
 run;

/* LDVR Analysis of Model (5) */


/* Model (5) */


ods table infocrit;  
proc mixed IC covtest data=s1 Method=ML empirical;
 class iso yearn;
 model dlgdp_pc_usd=iso t5_varm    /solution ;
 random  yearn/subject=iso type=vc;
 title 'LDVR (5)';
run;
quit;

