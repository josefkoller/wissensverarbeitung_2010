
close all;

%watch the WAVE!
[w1, w2] = meshgrid(-10:0.1:10, -10:0.1:10);
result = f(w1, w2);
figure;
surf(w1, w2, result);
[xc,yc] = solve(fx,fy,x,y);  % extrema  SYMBOLIC
