/* Generated Code (IMPORT) */
/* Source File: Data Organized2.xlsx */
/* Source Path: /folders/myfolders/sasuser.v94/jatropha */
/* Code generated on: 1/8/20, 12:59 PM */

%web_drop_table(JATROPHA.DATA);


FILENAME REFFILE '/folders/myfolders/sasuser.v94/jatropha/Data Organized2.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=JATROPHA.DATA;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=JATROPHA.DATA; RUN;


%web_open_table(JATROPHA.DATA);