Initial dataset variables - 2 datasets with the same characteristics, one train one test
	Subject (1-30, randomly assigned to test and train groups)
	Labels (indicators of activity, 1-6 coding for 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING)
	561 columns with the features of a time series measurements for each feature measurement of an activity of a given subject
	Multiple measurements per feature per activity per subject

After transformation
	Subject (1-30, pooled)
	Label (indicators of activity with comprehensive names WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING)
	Group (indicator of group in original dataset)
	79 columns with the features including only those that indicate the mean and the standard deviation of each feature
	Multiple measurements per feature per activity per subject

After summary
	Subject (1-30, pooled)
	Label (indicators of activity with comprehensive names)
	79 columns with the with the features including only those that indicate the mean and the standard deviation of each feature
	One number per feature per activity per subject, consisting of the average of the multiple measurements per feature per activity per subject in the original datasets
