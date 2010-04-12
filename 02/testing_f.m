
%watch the WAVE!
%[w1, w2] = meshgrid(-10:0.1:10, -10:0.1:10);
%result = f(w1, w2);
%figure;
%surf(w1, w2, result);
%[xc,yc] = solve(fx,fy,x,y);  % extrema  SYMBOLIC

w0 = [2,2]; % also try 0,0 to find the other minima
eta = 0.3;
numIter = 20;

[weights, error] = gradientDescentHw2(w0, numIter, eta)

