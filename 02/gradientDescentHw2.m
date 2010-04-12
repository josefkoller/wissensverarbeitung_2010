function [weights, error] = gradientDescentHw2(w0, numIter, eta)
    error = zeros(numIter, 1);
    weights = zeros(numIter + 1, 2);
    weights(1, :) = w0;
    w = w0;
    gradient = f_gradient();
    dw = zeros(2, 1);
    for iteration = 1:numIter
        error(iteration) = f(w(1), w(2));
        dw = gradient(w(1), w(2));
        w = w - eta * dw;
        weights(iteration + 1, :) = w;
    end
end