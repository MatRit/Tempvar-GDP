



/* Define your input path */
/* overwrite 'E:\_dPdT_work\_2021\_first_attempts' with your local path */

%let _DTAS='E:\_dPdT_work\_2021\_first_attempts\T_econ.dta';


/* DTAS data imported */
proc import datafile=&_DTAS
    out=s1(where=(dlgdp_pc_usd ne . and T5_varm ne .))
    dbms=dta
    replace;
 run;

/* DV OLS Analysis of CS1 */


/* Model (2) */
proc glm data=s1;
class id iso yearn;
 model dlgdp_pc_usd=t5_varm
                    iso yearn 
                      
				    /effectsize solution SS3;
 title 'Modell (2)';
run;
quit;

