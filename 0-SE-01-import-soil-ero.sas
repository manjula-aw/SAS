%web_drop_table(JATROPHA.SOILERO);


FILENAME REFFILE '/folders/myfolders/sasuser.v94/jatropha/soil-erosion-diff-for-sas.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=JATROPHA.SOILERO;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=JATROPHA.SOILERO; RUN;


%web_open_table(JATROPHA.SOILERO);