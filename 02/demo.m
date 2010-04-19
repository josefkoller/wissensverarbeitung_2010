
%close all;

%watch the WAVE!
CONST = 2;
[w1, w2] = meshgrid(-CONST:0.1:CONST, -CONST:0.1:CONST);
result = f(w1, w2);
figure;
surf(w1, w2, result);
[xc,yc] = solve(fx,fy,x,y);  % extrema  SYMBOLIC
