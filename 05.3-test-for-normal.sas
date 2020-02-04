ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/normal-plots.rtf';


PROC UNIVARIATE data=jatropha.datacp1 NORMAL PLOT;

	CLASS Fertilizer;
	VAR Height NumOfBranches NumOfLeaves NumOfFlowers NumOfFruits;
RUN;
ODS RTF CLOSE;