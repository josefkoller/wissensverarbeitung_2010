%hw_2_1_5

close all;

if 1 == 2
eta = 0.1;
numIter = 100;
GRID_SIZE = 40;

minf = zeros(GRID_SIZE + 1, GRID_SIZE + 1);

for i = 0:GRID_SIZE
    for j = 0:GRID_SIZE
        w0 = [-2 + 0.1 * i, -2 + 0.1 * j];    
        [weights, error_list] = gradientDescentHw2(w0, numIter, eta);
        error = error_list(end);
        minf(i + 1, j + 1) = error;
    end
end

end
% 2_1_6

figure;
%[x, y] = meshgrid(0:GRID_SIZE, 0:GRID_SIZE);
temp = linspace(-2, 2, GRID_SIZE + 1);
[x, y] = meshgrid(temp, temp);

handle = surf(x, y, minf);
xlabel('w1');
ylabel('w2');
zlabel('error');

global_min_point_count = sum(sum(minf < -2 ));
global_min_point_percentage = global_min_point_count / GRID_SIZE ^ 2 * 100


