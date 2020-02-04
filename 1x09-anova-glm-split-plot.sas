/* ANOVA for split plot design
https://support.sas.com/documentation/cdl/en/statug/63033/HTML/default/viewer.htm#statug_anova_sect028.htm
*/
ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/anova-glm-height.rtf';

proc GLM data=jatropha.datacp1;
	WHERE not (Block EQ 1 AND Fertilizer EQ 2);/* Treating tree shadow block as missing data ? */
	
	class Block Fertilizer Accession;
	TITLE "ANOVA for SplitPlot Design";
	model Height=Block Fertilizer Block*Fertilizer Accession Fertilizer*Accession;
	test h=Block Fertilizer e=Block*Fertilizer;
	
	run;
	
ODS RTF CLOSE;