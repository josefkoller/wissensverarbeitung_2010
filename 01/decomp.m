
clear all;
close all;

load('linearregression_homework_10.mat');


nDataSets = length(x_train);

% Calculate optimal w 
% This can be calculated with the big dataset (x_true, y_true
degree = 10;
X_true = calculate_matrix(x_true, degree);

nr_alphas = 25;
alphas = logspace(-2, 2, nr_alphas);
structure_errors = zeros(nr_alphas, 1);
approx_errors = zeros(nr_alphas, 1);
for i = 1:nr_alphas
    alpha = alphas(i);
    w_opt = calculate_weight(alpha, X_true, y_true, degree );
    structure_errors(i) = mean((y_true - X_true * w_opt) .^ 2);
    
    approx_error = zeros(nDataSets, 1);
    for j = 1:nDataSets
        X_train = calculate_matrix(x_train{j}, degree);
        w = calculate_weight(alpha, X_train, y_train{j}, degree);
        approx_error(j) = mean((X_true * w - X_true * w_opt) .^ 2);       
    end
    
    approx_errors(i) = mean(approx_error);

end

expected_errors = structure_errors + approx_errors;

figure;
semilogx(alphas, structure_errors, 'c-');
hold on;
semilogx(alphas, approx_errors, 'r-');
semilogx(alphas, expected_errors, 'b-');
hold off;
legend('Structure Error', 'Approximation Error', 'Expected Error');


