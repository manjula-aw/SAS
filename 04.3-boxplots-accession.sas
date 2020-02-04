ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/boxplot-accession.rtf';

PROC SORT DATA=jatropha.datacp1;
	BY Accession;
RUN;

proc sgplot data=jatropha.datacp1;
	TITLE "Boxplots of Height (cm) - grouped by Accession";
	vbox Height / category=Accession;
	yaxis label="Height (cm)";
run;

proc sgplot data=jatropha.datacp1;
	TITLE "Boxplots of No. of flowers - grouped by Accession";
	vbox NumOfFlowers / category=Accession;
	yaxis label="No. of flowers";
run;

proc sgplot data=jatropha.datacp1;
	TITLE "Boxplots of No. of fruits - grouped by Accession";
	vbox NumOfFruits / category=Accession;
	yaxis label="No. of fruits";
run;

ODS RTF CLOSE;