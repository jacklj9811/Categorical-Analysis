* Read the CSV file into a SAS dataset;
proc import datafile="/home/u63798754/sasuser.v94/diabetes.csv" 
    out=diabetes 
    dbms=csv 
    replace;
run;

* Transform 'Outcome' values from 0 to 'Diabetes' and 1 to 'No_Diabetes' and create BMI categories;
data diabetes;
    set diabetes;
    
    * Explicitly declare the length of character variables;
    length BMI_ord $40;  * Ensure this is long enough for the longest category;

    * Create a new variable for the transformed Outcome;
    if Outcome = 0 then Outcome_char = 'No Diabetes';
    else if Outcome = 1 then Outcome_char = 'Diabetes';
    format Outcome_char $12.;
    
    * Create BMI categories;
    if BMI < 18.5 then BMI_ord = "Underweight";
    else if BMI < 25 then BMI_ord = "Healthy Weight";
    else if BMI < 30 then BMI_ord = "Overweight";
    else BMI_ord = "Obesity";
    format BMI_ord $40.;
run;

/* proc print data=diabetes; */
/*     title "Transformed Data"; */
/* run; */


proc format;
    value bmi_fmt
        low-18.4 = 'Underweight'
        18.5-24.9 = 'Healthy Weight'
        25-29.9 = 'Overweight'
        30-high = 'Obesity';
run;

data diabetes;
	set diabetes;
	format BMI bmi_fmt.;
Run;

* Frequency table of BMI categories vs. Diabetes Outcome;
proc freq data=diabetes;
    tables BMI*Outcome_char / norow nocol nopercent missing;
    title "BMI Categories vs. Diabetes Outcome";
run;

* Mosaic plot with ordered BMI categories and corresponding chi-square test for independence;
proc freq data=diabetes;
    tables Outcome_char*BMI / norow chisq plots=MOSAIC;
    title "Mosaic Plot of Diabetes Outcome by BMI Categories";
run;

* Chi-square test for independence;
proc freq data=diabetes;
    tables BMI_ord*Outcome_char / chisq expected;
run;

* Logistic regression with BMI as the predictor;
proc logistic data=diabetes;
    class Outcome_char(ref="No Diabetes") BMI_ord(ref="Healthy Weight") / param=ref;
    model Outcome_char = BMI_ord / clparm=wald;
run;
