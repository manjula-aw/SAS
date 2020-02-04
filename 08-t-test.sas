DATA WEIGHT;
	INPUT Treat $ SoilEr;
	DATALINES;
    'Fertilized' 0.47
    'Fertilized' 1.00
    'Fertilized' 0.15
    'Fertilized' 0.30
    'Fertilized' 0.82
    'Fertilized' 0.00
    'Fertilized' 0.00
    'Fertilized' 0.00
    'Fertilized' 0.05
    'Fertilized' 0.42
    'unfertilized' 0.17
    'unfertilized' 0.80
    'unfertilized' 0.10
    'unfertilized' 0.10
    'unfertilized' 0.75
    'unfertilized' 0.10
    'unfertilized' 0.00
    'unfertilized' 0.00
    'unfertilized' 0.90
    'unfertilized' 0.68
    ;

PROC TTEST;
	class Treat;
	var SoilEr;
	TITLE "Positive Average per treatment - erosion per RF event - 1st event"
Run;