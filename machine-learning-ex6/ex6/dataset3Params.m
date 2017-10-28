function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

test_C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
test_sig = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
best_error = 1000;

for C_loc = 1:length(test_C)
	for sig_loc = 1:length(test_sig)
		model = svmTrain(X, y, test_C(C_loc), @(x1, x2) gaussianKernel(x1, x2, test_sig(sig_loc)));
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		if error < best_error
			best_error = error;
			C = test_C(C_loc);
			sigma = test_sig(sig_loc);
	end
end


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%







% =========================================================================

end
