ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/ppplot.rtf';

proc univariate data=jatropha.datacp1 NOPRINT;
	class Fertilizer;
	ppplot Height NumOfBranches NumOfLeaves NumOfFlowers NumOfFruits  / normal ;

	/*qqplot Height NumOfBranches NumOfFlowers NumOfFruits NumOfLeaves / normal;*/
run;

ODS RTF CLOSE;