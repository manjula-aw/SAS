
proc glm data=jatropha.datacp1  plots=intplot;/*plots=meanplot*/
class  Accession Fertilizer;
model  Height = Accession | Fertilizer;
run;
/*
https://support.sas.com/resources/papers/proceedings/proceedings/forum2007/041-2007.pdf
*/
