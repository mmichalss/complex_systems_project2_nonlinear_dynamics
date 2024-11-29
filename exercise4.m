% exercise 4

% x* = x(3 - x -2y)
% y* = y(2 - x - y)
% roots: (1, 1), (0,0), (3,0), (0,2)

% unstable
f1 = '$\dot{x} = x(3 - x -2y)\hspace*{2mm}\dot{y} = y(2 - x - y)$';
fx = @(x, y) x.*(3 - x - 2.*y);
fy = @(x, y) y.*(2 - x - y);

x_range = -1: 0.2 :4;
y_range = -1: 0.2 :4;
N = 1:150;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx, fy, x_range, y_range, N, f1);

% stable

x_range = 0: 0.4 :4;
y_range = 0: 0.4 :4;
N = 1:100;
delta_t = 0.05;

% Lotka-Volterra equations
f2 = '$\dot{x} = x(3 - 2y)\hspace*{2mm}\dot{y} = -y(2 - x)$';
fx = @(x, y) x.*(3 - 2.*y);
fy = @(x, y) -y.*(2 - x);


plot_phase_portrait(delta_t, fx, fy, x_range, y_range, N, f2);