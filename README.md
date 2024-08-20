# Categorical Analysis on Diabetes and BMI over Pima Indian Patients

## Introduction
This project conducts a categorical analysis on the [Kaggle Diabetes Dataset](https://www.kaggle.com/datasets/mathchi/diabetes-data-set). 

## Authors
Liangjie Lu, Weiting Lin, Luyang Zhang, Yaocao Chen

## Data Source
This dataset originates from the National Institute of Diabetes and Digestive and Kidney Diseases (NIDDK) and is available on Kaggle. It focuses on predicting diabetes presence based on diagnostic measures among female Pima Indian patients aged 21 or older.

## Data Description
The dataset aims to predict diabetes occurrence based on various diagnostic measurements. It includes data exclusively from female Pima Indian patients, selected based on specific criteria. This dataset reflects the significant health challenges faced by the Keli Akimel O'odham and Onk Akimel O'odham communities. These two communities are notable for their high type 2 diabetes prevalence, and have been studied extensively due to their genetic homogeneity.

The dataset includes the following variables:
- **Pregnancies:** Number of pregnancies
- **Glucose:** Plasma glucose concentration
- **BloodPressure:** Diastolic blood pressure (mm Hg)
- **SkinThickness:** Triceps skin fold thickness (mm)
- **Insulin:** 2-hour serum insulin (mu U/ml)
- **BMI:** Body mass index (weight in kg/(height in m)^2)
- **DiabetesPedigreeFunction:** A function that scores likelihood of diabetes based on family history
- **Age:** Age in years
- **Outcome:** Class variable (0 or 1) indicating diabetes status

## Problem Statement
Our project investigates the relationship between Body Mass Index (BMI) and diabetes incidence. Specifically, we examine whether there is statistical dependence between an individual's BMI category and their diabetes status. The analysis transforms the numeric BMI data into categorical data according to CDC standards:

- **Below 18.5:** Underweight
- **18.5 – 24.9:** Healthy Weight
- **25.0 – 29.9:** Overweight
- **30.0 and above:** Obesity

Our primary research questions are:
1. Is there a statistical dependence between BMI categories and diabetes status?
2. Can we predict diabetes risk in Pima Indian females aged 21 or older based on BMI?

## Statistical Models
We choose to use these following models to study the relationship between BMI and diabetes incidence:
- **Independent Test:** Pearson’s Test (𝑿2) / Log Likelihood Test (𝑮2)
- **Ordinal Correlation Test:** Assessing independence by using sample correlation as the test statistic, with mean BMI values for each category as the basis.
- **Fisher’s Test:** Apply on the whole dataset. Apply on healthy BMI and other three categories to find the relationship between abnormal BMI with healthy BMI.  
- **Logistics Model with Binomial:** Regress diabetes status on BMI raw scores

## Conclusion
1. **Dependence Analysis:** Pearson’s and Log-likelihood tests indicate a significant dependence between diabetes status and BMI categories, with p-values less than 0.0001.
2. **Hypothesis Testing:** The null hypothesis of zero correlation between diabetes outcomes and BMI categories is rejected at a significance level of 0.001.
3. **Fisher’s Exact Test:** A statistically significant association between BMI categories and diabetes outcome is found, with higher BMI increasing the odds of diabetes.
4. **Logistic Regression:** BMI is identified as a significant predictor of diabetes.
5. **Odds Ratio:** The odds of having diabetes are higher among patients classified as obese compared to those who are not.
