% exercise 2 complex_systems laboratory project 2
% deadline: 22.11.2024.

%% First function x** + x = 0 %
% y = x*
% y' = -x
 
f1 = '$\ddot{x} + x = 0$';
fx_1 = @(x,y) y;
fy_1 = @(x,y) -x;

x = -1: 0.17 :1;
y = -1: 0.17 :1;
N = 1:60;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx_1, fy_1, x, y, N, f1);

%% Second function x** + sin(x) = 0 %
% y = x*
% y' = -sin(x)

f2 = '$\ddot{x} + sin(x) = 0$';
fx_2 = @(x,y) y;
fy_2 = @(x,t) -sin(x);

x = -2.5*pi: pi/3 :2.5*pi;
y = -10: 1 :10;
N = 1:60;
delta_t = 0.2;

plot_phase_portrait(delta_t, fx_2, fy_2, x, y, N, f2, true);

%% Third function %

% x** + x - x^3 = 0
% y = x*
% y* = -x + x^3

f3 = '$\ddot{x} + x - x^3= 0$';
fx_3 = @(x,y) y;
fy_3 = @(x,y) -x + x.^3;

% roots:
%   y = 0
%   x = 0 and 1 and -1

x = -2: 0.2 :2;
y = -2: 0.2 :2;
N = 1:60;
delta_t = 0.01;

plot_phase_portrait(delta_t, fx_3, fy_3, x, y, N, f3);

%% Fourth function %

% x** - x + x^3 = 0
% y = x*
% y* = x - x^3

f4 = '$\ddot{x} -x + x^3 = 0$';
fx_4 = @(x,y) y;
fy_4 = @(x,y) x - x.^3;

% roots:
%   y = 0
%   x = 0 and 1 and -1

x = -2: 0.2 :2;
y = -2: 0.2 :2;
N = 1:60;
delta_t = 0.01;

plot_phase_portrait(delta_t, fx_4, fy_4, x, y, N, f4);
