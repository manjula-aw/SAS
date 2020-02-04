/*****************************************************************************************************************

SAS file name: Discrete_Dist_Fit.sas
File location: 
_________________________________________________________________________________________________________________

Purpose: Fit discrete distributions to univariate data using PROC GENMOD
Author: Peter Clemmensen
Creation Date: 12/07/2017

This program supports the blog post "Fit Discrete Distributions to Univariate Data" on SASnrd.com

*****************************************************************************************************************/
/* 

https://sasnrd.com/sas-fit-discrete-distribution/
https://sasnrd.com/wp-content/uploads/2017/08/Discrete_Dist_Fit.txt 

*/
ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/fit-num-flowers.rtf';
/* Tabulate counts and plot data */
proc freq data=jatropha.datacp1 noprint;
   tables NumOfFlowers / out=CountMinMax;
run;
data _null_;
   set CountMinMax end=eof;
   if _N_=1 then call symputx('minCount', NumOfFlowers);
   if eof then call symputx('maxCount', NumOfFlowers);
run;
%put min=&minCount max=&maxCount;

/* Visualize the data */
title 'Frequency plot of No. of flowers';
proc sgplot data=jatropha.datacp1;
   vbar NumOfFlowers;
   /*xaxis display=(nolabel);
   yaxis display=(nolabel);*/
run;
title;

/* Fit Poisson distribution to data */
proc genmod data=jatropha.datacp1;
   model NumOfFlowers= /dist=Poisson;       /* No variables are specified, only mean is estimated */
   output out=PoissonFit p=lambda;
run;

/* Save Poisson parameter lambda in macro variables */
data _null_;
   set PoissonFit(obs=1);
   call symputx('lambda', lambda);
run;

/* Use Min/Max values and the fitted Lambda to create theoretical Poisson Data */
data TheoreticalPoisson;
   do NumOfFlowers=&minCount to &maxCount;
      po=pdf('Poisson', NumOfFlowers, &lambda);
      output;
   end;
run;


/* Negative Binomial Example */

/* Fit Negative Binomial distribution to data */
proc genmod data=jatropha.datacp1;
   model NumOfFlowers= /dist=NegBin;       /* No variables are specified, only mean is estimated */
   ods output parameterestimates=NegBinParameters;
run;

/* Transpose Data */
proc transpose data=NegBinParameters out=NegBinParameters;
   var estimate;
   id parameter;
run;

/* Calculate k and p from intercept and dispersion parameters */
data NegBinParameters;
   set NegBinParameters;
   k = 1/dispersion;
   p = 1/(1+exp(intercept)*dispersion);
run;

/* Save k and p in macro variables */
data _null_;
   set NegBinParameters;
   call symputx('k', k);
   call symputx('p', p);
run;

/* Calculate theoretical Negative Binomial PMF based on fitted k and p */
data TheoreticalNegBin;
   do NumOfFlowers=&minCount to &maxCount;
      NegBin=pdf('NegBinomial', NumOfFlowers, &p, &k);
      output;
   end;
run;

/* Merge The datasets for plotting */
data PlotData(keep=NumOfFlowers freq po negbin);
   merge TheoreticalPoisson TheoreticalNegBin CountMinMax;
   by NumOfFlowers;
   freq = PERCENT/100;
run;

/* Overlay fitted Poisson density with original data */
title 'No. of flowers overlaid with fitted distributions';
proc sgplot data=PlotData noautolegend;
   vbarparm category=NumOfFlowers response=freq / legendlabel='No. of flowers';
   series x=NumOfFlowers y=po / markers markerattrs=(symbol=circlefilled color=red) 
                         lineattrs=(color=red)legendlabel='Fitted Poisson PMF';
   series x=NumOfFlowers y=NegBin / markers markerattrs=(symbol=squarefilled color=green) 
                             lineattrs=(color=green)legendlabel='Fitted Negative Binomial PMF';
   xaxis  fitpolicy=rotatethin;
   /*yaxis display=(nolabel);*/
   keylegend / location=inside position=NE across=1;
run;
title;
ODS RTF CLOSE;
