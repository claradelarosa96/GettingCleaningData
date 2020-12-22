Initial dataset variables
	Subject (1-30, randomly assigned to test and train groups)
	Labels (indicators of activity, 1-6 coding for 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING)
	561 Time series measurements for each measurement of an activity of a given subject

After transformation
	Subject (1-30, pooled)
	Label (indicators of activity with comprehensive names)
	Group (indicator of group in original dataset)
	Mean_measures (mean of the 561 time data points per individual measurement of one activity for one subject)
	Sd_measures (stamdard deviation of the 561 time data points per individual measurement of one activity for one subject)

After summary
	Subject (1-30, pooled)
	Label (indicators of activity with comprehensive names)
	Av_mean (average of mean of all time series measurements for each activity of each subject)
	Av_sd (average of sd of all time series measurements for each activity of each subject)