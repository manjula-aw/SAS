/*
Tests for Negative Binomial Distributions
- https://dl.sciencesocieties.org/publications/aj/articles/107/2/811
- https://dl.sciencesocieties.org/publications/aj/supplements/107/811-supplement7.sas
- https://stats.stackexchange.com/questions/416417/kruskal-wallis-and-negative-binomial-regression-do-not-agree
*/
/*
Reference where LSMEAN is proposed for posthoc of Negative Binomial
- https://www.sfu.ca/sasdoc/sashtml/stat/chap30/sect34.htm
- https://www.researchgate.net/post/Conducting_a_post-hoc_analysis_with_highly_dispersed_count_data
- https://stats.stackexchange.com/questions/102857/post-hoc-after-glm
- https://stats.stackexchange.com/questions/332412/negative-binomial-pairwise-comparison-in-r/332413#332413
- https://support.sas.com/resources/papers/proceedings14/SAS060-2014.pdf
- https://webpages.uidaho.edu/cals-statprog/sas/workshops/glm/lsmeans.htm
*/
%include '/folders/myfolders/sasuser.v94/jatropha/mult.sas';
ODS RTF FILE='/folders/myfolders/sasuser.v94/jatropha/negbinom-fruits.rtf';

proc glimmix data=jatropha.datacp1 method=LaPlace;
	/* Remove accessions with all zero values. 
	See https://site.caes.uga.edu/expstatgrif/files/2018/07/CountsGLMMfin1.pdf
	"In my experience, sparse data is the most common problem when analyzing count data. 
	When treatment levels or combinations have data values that are all zeros, maximum likelihood estimation techniques
	cannot estimate zero for those levels. " */
	where Not (Accession EQ "OM1" OR Accession EQ 'NW' OR Accession EQ 'PE');
	
	ods output lsmeans=lsmeans diffs=diffs;

	/*title 'GLMM: split-plot linear preditor, Negative Binomial data (equiv to Gamma split-plot effect)';*/
	class Block Fertilizer Accession;
	model NumOfFruits=Fertilizer|Accession / dist=NegBin link=log;
	random intercept / subject=Block(Fertilizer);

/** LSMEAN https://support.sas.com/resources/papers/proceedings14/SAS060-2014.pdf */

	lsmeans Accession/ilink pdiff;
	/*
	http://agrobiol.sggw.waw.pl/~cbcs/articles/CBCS_7_1_2.pdf
	*/
	%mult(trt=Accession);
run;

ODS RTF CLOSE; 