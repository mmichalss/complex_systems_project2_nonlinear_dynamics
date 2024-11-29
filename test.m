% Define the differential equation dy/dx = x + y
f = @(x, y) -sin(x);

% Create a grid of x and y values
[x, y] = meshgrid(-5:0.5:5, -5:0.5:5);

% Compute the slopes at each point on the grid
slope = f(x, y);

% Define levels for isoclines (constant slopes)
c_values = -5:1:5;

% Plot the isoclines using contour
figure;
contour(x, y, slope, c_values, 'LineWidth', 1);
xlabel('x');
ylabel('y');
title('Isoclines of dy/dx = -x');
grid on;