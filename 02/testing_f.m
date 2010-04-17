
%watch the WAVE!
%[w1, w2] = meshgrid(-10:0.1:10, -10:0.1:10);
%result = f(w1, w2);
%figure;
%surf(w1, w2, result);
%[xc,yc] = solve(fx,fy,x,y);  % extrema  SYMBOLIC

%w0 = [2,2]; % also try 0,0 to find the other minima
%eta = 0.3;
%numIter = 20;


w0 = [-0.2, -0.5];
eta_list = 0.4:-0.1:0.1;
numIter = 100;

weights_matrix = zeros(length(eta_list), numIter+1);
for eta_index = 1:length(eta_list)
    eta = eta_list(eta_index);
    [weights, error] = gradientDescentHw2(w0, numIter, eta);
    size(weights)
    %weights_matrix(eta_index, :) = weights;
end
plotErrorFunction(weights_matrix);