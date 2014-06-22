GCD-Project
===========

Getting and Cleaning Data Course Project

The raw data for this project is from  UCI Machine Learning Repository.

It is a Human Activity Recognition Using Smartphones Data Set built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The source of this data is:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws


A detailed description of the original data set and the changes made to it can be found in the file CODE_BOOK.md, which is available in this repository.

From this original data set, all the variables expressing mean and standard deviations of each variable have been extracted. For each subject and activity pair, the average value of all observations have been calculated.

Instructions for use:

1. Start from a folder containg the folderthat contains the unzipped UCI HAR Dataset (can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
2. The working directory should contain 2 folders (test & train) and 4 files.
3. Run run_analysis.R (run_analysis.R was developed with R version 3.0.3)
4. Output is called TidyData.txt.  The text file separator is a space (" ").

This repository contains a codebook which describes all variables in detail. 
