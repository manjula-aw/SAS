/* 
ANOVA for split plot design
References:
- https://support.sas.com/documentation/cdl/en/statug/63033/HTML/default/viewer.htm#statug_anova_sect028.htm
- Chapter 13 in S. Samitha's book,'Basic Designs In Agricultural Experiments'
*/
ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/anova-height.rtf';
/*ods graphics off;*/

proc ANOVA data=jatropha.datacp1;
	class Block Fertilizer Accession;

	TITLE "Analysis of Height (cm) for Split Plot Design";
	model Height=Block Fertilizer Block*Fertilizer Accession Fertilizer*Accession;
	test h=Block Fertilizer e=Block*Fertilizer;
	/* 
	LSMEAN -> when there is a need to consider a COVARIATE etc.
	LSD or DMRT -> to control comparison wise error rate. 
	LSD is not good when doing all possible comparisons - S. Samitha's book, 
	'Basic Designs In Agricultural Experiments', Chapter 8.
	Therefore DMRT is selected for mean comparison.
	*/
	MEAN Accession / duncan;
	run;

ODS RTF CLOSE;
	/*
	proc anova data=Split;
	class Block A B;
	model Response = Block A Block*A B A*B;
	test h=A e=Block*A;
	run;*/
	/*
	
	proc GLM data=jatropha.datacp1;
	class Block Fertilizer Accession;
	
	model Height=Block Fertilizer Block*Fertilizer Accession Fertilizer*Accession;
	test h=Block Fertilizer e=Block*Fertilizer;
	MEAN Accession / duncan lsd;
	CONTRAST 'AD3 vs others' Accession -1 -1 -1 31 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1;
	CONTRAST 'KR vs others ' Accession -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 31 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1;
	run;
	*/