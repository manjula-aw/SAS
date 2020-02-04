ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/scattermatrix.rtf';

proc sgscatter data=jatropha.datacp1;
	title 
		"Scatter plot matrix on Jatropha curcas L. plant data – grouped by fertilizer applications";
	LABEL Height='Height (cm)' NumOfBranches='No. of branches' 
		NumOfLeaves='No. of leaves' NumOfFlowers='No. of flowers' 
		NumOfFruits='No. of fruits';
	matrix Height NumOfBranches NumOfLeaves NumOfFlowers NumOfFruits / 
		group=Fertilizer diagonal=(histogram normal);
run;

title;
ODS RTF CLOSE;