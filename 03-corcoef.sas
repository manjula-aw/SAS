ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/corcoeffp.rtf';

PROC CORR data=jatropha.datacp1;
	LABEL Height='Height (cm)' NumOfBranches='No. of branches' 
		NumOfLeaves='No. of leaves' NumOfFlowers='No. of flowers' NumOfFruits='No. of fruits';
	VAR Height NumOfBranches NumOfLeaves NumOfFlowers NumOfFruits;
RUN;

ODS RTF CLOSE;