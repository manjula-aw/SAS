ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/histograms.rtf';

/*PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for Final Plant Height";
VAR Height;
HISTOGRAM Height /CFILL=GREY CFRAME=WHITE NORMAL;

RUN;

PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for Initial Plant Height";
VAR InitialHeight;
HISTOGRAM InitialHeight /CFILL=GREY CFRAME=WHITE NORMAL;
RUN;

PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for NumOfBranches";
VAR NumOfBranches;
HISTOGRAM NumOfBranches /CFILL=GREY CFRAME=WHITE NORMAL;
RUN;

PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for NumOfFlowers";
VAR NumOfFlowers;
HISTOGRAM NumOfFlowers /CFILL=GREY CFRAME=WHITE NORMAL;
RUN;

PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for NumOfFruits";
VAR NumOfFruits;
HISTOGRAM NumOfFruits /CFILL=GREY CFRAME=WHITE NORMAL;
RUN;

PROC UNIVARIATE DATA=jatropha.datacp1;
class Fertilizer;
TITLE "Histogram for NumOfLeaves";
VAR NumOfLeaves;
HISTOGRAM NumOfLeaves /CFILL=GREY CFRAME=WHITE NORMAL;
RUN;*/
proc sgplot data=jatropha.datacp1;
	TITLE "Histogram of Plant Height - grouped by Fertilizer";
	histogram Height / GROUP=Fertilizer transparency=0.5 binstart=0 binwidth=10;
	density Height / type=NORMAL GROUP=Fertilizer;
	yaxis grid;
	xaxis display=(nolabel) values=(-100 to 200 by 10);
run;


proc sgplot data=jatropha.datacp1;
	TITLE "Histogram of No. of Branches - grouped by Fertilizer";
	histogram NumOfBranches / GROUP=Fertilizer transparency=0.5;
	density NumOfBranches / type=NORMAL GROUP=Fertilizer;
	yaxis grid;
	xaxis display=(nolabel);
run;


proc sgplot data=jatropha.datacp1;
	TITLE "Histogram of No. of Flowers - grouped by Fertilizer";
	histogram NumOfFlowers / GROUP=Fertilizer transparency=0.5;
	density NumOfFlowers / type=NORMAL GROUP=Fertilizer;
	yaxis grid;
	xaxis display=(nolabel);
run;


proc sgplot data=jatropha.datacp1;
	TITLE "Histogram of No. of Fruits - grouped by Fertilizer";
	histogram NumOfFruits / GROUP=Fertilizer transparency=0.5;
	density NumOfFruits / type=NORMAL GROUP=Fertilizer;
	yaxis grid;
	xaxis display=(nolabel);
run;


proc sgplot data=jatropha.datacp1;
	TITLE "Histogram of No. of Leaves - grouped by Fertilizer";
	histogram NumOfLeaves / GROUP=Fertilizer transparency=0.5;
	density NumOfLeaves / type=NORMAL GROUP=Fertilizer;
	yaxis grid;
	xaxis display=(nolabel);
run;

ODS RTF CLOSE;