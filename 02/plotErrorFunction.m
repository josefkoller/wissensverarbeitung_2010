function [] = plotErrorFunction(weights)

x = -2:0.1:2;
y = -2:0.1:2;
w1 = meshgrid(x, y);
w2 = w1';

error = f(w1, w2);

contour(x, y, error, 30); % x,y ... coordinates of the surface; 
                                    % error... heights above the plane;
                                    % error = f(x,y)
hold all;
handle(1) = plot(weights(:,1), weights(:,2), 'ro-', 'LineWidth', 3); % plotting first and second columns of all rows
handle(2) = plot(weights(end,1), weights(end,2), 'ks', 'MarkerSize', 10, 'LineWidth', 3); % plotting last row ... end vector
handle(3) = plot(weights(1,1), weights(1,2), 'ko', 'MarkerSize', 10, 'LineWidth', 3); % plotting first row .. start vector
legend(handle, 'Weights', 'EndVector', 'StartVector', 'Location', 'SouthEast');
