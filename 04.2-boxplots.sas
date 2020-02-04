ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/boxplot.rtf';

PROC SORT DATA=jatropha.datacp1;
	BY Fertilizer;
RUN;

PROC BOXPLOT DATA=jatropha.datacp1;
	PLOT Height*Fertilizer /BOXSTYLE=schematicid;
	ID Accession;
RUN;

PROC BOXPLOT DATA=jatropha.datacp1;
	PLOT NumOfBranches*Fertilizer /BOXSTYLE=schematicid;
	ID Accession;
RUN;

PROC BOXPLOT DATA=jatropha.datacp1;
	PLOT NumOfLeaves*Fertilizer /BOXSTYLE=schematicid;
	ID Accession;
RUN;

PROC BOXPLOT DATA=jatropha.datacp1;
	PLOT NumOfFlowers*Fertilizer /BOXSTYLE=schematicid;
	ID Accession;
RUN;

PROC BOXPLOT DATA=jatropha.datacp1;
	PLOT NumOfFruits*Fertilizer /BOXSTYLE=schematicid;
	ID Accession;
RUN;

ODS RTF CLOSE;