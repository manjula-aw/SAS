ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/scatterplt.rtf';

/*PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=InitialHeight y=Height /markerattrs=(symbol=CircleFilled) GROUP=Fertilizer;
RUN;*/

PROC SGPLOT DATA=jatropha.datacp1;
	/*styleattrs datasymbols=(CircleFilled SquareFilled) datacontrastcolors=(purple 
		green);*/
	scatter x=Height y=NumOfBranches /markerattrs=(symbol=CircleFilled) GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=Height y=NumOfFlowers / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=Height y=NumOfFruits / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=Height y=NumOfLeaves / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfBranches y=NumOfFlowers / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfBranches y=NumOfFruits / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfBranches y=NumOfLeaves / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfFlowers y=NumOfFruits / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfFlowers y=NumOfLeaves / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

PROC SGPLOT DATA=jatropha.datacp1;
	scatter x=NumOfLeaves y=NumOfFruits / markerattrs=(symbol=CircleFilled) 
		GROUP=Fertilizer;
RUN;

ODS RTF CLOSE;