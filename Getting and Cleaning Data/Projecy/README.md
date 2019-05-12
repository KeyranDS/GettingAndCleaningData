The run_analysis.R works as follow:
1. Reads all of the Samsung untidy data
2. Merges the training (7352 observations) and testing (2947 observations) sets in one dataset (10299 observations, 561 variables)
3. Extracts only the variables giving the mean or standard deviation of the measurements (78 variables)
4. Uses the "feature.txt" file to give appropriate names to the different variables
5. Adds two variables "activity" (y_test.txt + y_train.txt) and "subject" (subject_train.txt + subject_test.txt) respectively giving the activity (among 6) and the number of the subject (1 to 30) for the measurement. To get to the activity variable, merges the dataset with the activity_labels.txt data to match a number from 1 to 6 to its corresponding activity.
6. Groups the dataset by subject and activity, and computes the mean for each group.