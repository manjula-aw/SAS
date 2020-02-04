PROC FORMAT;
	VALUE Fertilizer 1='Unfertilized' 2='Fertilized';
RUN;

PROC FORMAT;
	VALUE Block 1='Block1' 2='Block2';
RUN;

DATA jatropha.datacp1;
	SET jatropha.data;
	FORMAT Fertilizer Fertilizer.;
	FORMAT Block Block.;
	LABEL Height='Height (cm)' NumOfBranches='No. of branches' 
		NumOfLeaves='No. of leaves' NumOfFlowers='No. of flowers' 
		NumOfFruits='No. of fruits';
RUN;

ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/means.rtf';

PROC MEANS DATA=jatropha.datacp1;
RUN;

ODS RTF CLOSE;