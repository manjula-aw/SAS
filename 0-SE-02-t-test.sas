PROC FORMAT;
	VALUE $Measurement '0th-1st'='1st rain fall event' 
		'1st-2nd'='2nd rain fall event' '2nd-3rd'='3rd rain fall event' 
		'3rd-4th'='4th rain fall event' '4th-5th'='5th rain fall event';
RUN;

DATA JATROPHA.SOILERO;
	SET JATROPHA.SOILERO;
	FORMAT Measurement $Measurement.;
RUN;

proc sort data=JATROPHA.SOILERO;
	by Type Measurement;
run;

ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/soil-erosion-ttests.rtf';

PROC TTEST DATA=JATROPHA.SOILERO plots=none;
	by Type Measurement;
	class Treatment;
	var Value;
	TITLE "T-Test comparing positive average soil erosion #byval1 for #byval2 - between fertilized and unfertilized plots";
Run;

ODS RTF CLOSE;