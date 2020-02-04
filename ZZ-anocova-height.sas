/*
ANOCOVA
https://support.sas.com/documentation/cdl/en/statug/63033/HTML/default/viewer.htm#statug_glm_sect049.htm
*/
ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/anocova-height.rtf';

proc glm data=jatropha.datacp1;
	class Block Fertilizer Accession;
	model Height = Block Fertilizer Block*Fertilizer Accession Fertilizer*Accession InitialHeight / solution;
	lsmeans Block Fertilizer Block*Fertilizer Accession Fertilizer*Accession / stderr pdiff out=adjmeans;
	/* lsmeans Block Fertilizer Accession / stderr pdiff cov out=jatropha.adjmeans; */
run;

ODS RTF CLOSE;