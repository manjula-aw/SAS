proc sgplot data=jatropha.datacp1;
   title 'Height by Main Plot';
   series x=Accession y=Height / group=Block grouplc=Fertilizer name='grouping' markerattrs=(symbol=CircleFilled);
   keylegend 'grouping' / type=linecolor;
run;



proc sgplot data=jatropha.datacp1;
   title 'Height by Main Plot';
   series x=NumOfFlowers y=NumOfFlowers / group=Block grouplc=Fertilizer name='grouping';
   keylegend 'grouping' / type=linecolor;
run;

/* This was easily done using EXCEL instead */