clear all;
close all;

x1 = 0.5;
x2 = -0.5;
y = 0.2;

eta = 0.5; % Lernrate

w = [1, -1, 1, -1, 1, -1, 1, -1, 1];


% h  ... Aktivierungsfunktion (sigmoid)
% dh ... Ableitung

h = @(x) (1 / (1 + exp(-x)));
dh = @(x) (h(x) * (1 - h(x)));



a1 = w(2) * x1 + w(4) * x2;
z1 = h(a1);
a2 = w(3) * x1 + w(5) * x2;
z2 = h(a2);
a3 = w(1) * x1 + w(6) * z1;
z3 = h(a3);
a4 = w(8) * z3 + w(9) * z1 + w(7) * z2;
z4 = h(a4);

d4 = 2 * (z4 - y) * dh(a4);
d3 = w(8) * d4 * dh(a3);
d1 = (w(6) * d3 + w(9) * d4) * dh(a1);

delta_w2 = - eta * d1 * x1;