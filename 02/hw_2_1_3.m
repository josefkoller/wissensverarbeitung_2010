
close all;

w0 = [-0.2, -0.5];
eta_list = 0.4:-0.1:0.1; % step size
numIter = 100;

weights_matrix = zeros(length(eta_list), numIter+1);
for eta_index = 1:length(eta_list)
    eta = eta_list(eta_index);
    [weights, error] = gradientDescentHw2(w0, numIter, eta);
    plotErrorFunction(weights);
    title(sprintf('error surface for eta %0.2f', eta) );
end