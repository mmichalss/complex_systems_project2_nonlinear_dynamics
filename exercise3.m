% exercise 3


% x* = Ax, x in R^2 domain

%% example a)
A1 = [-2 1; 0 2];
f1 = '$\dot{x} = (-2 \hspace*{1mm}  1; 0 \hspace*{1mm} 2)x$';
fx1 = @(x1, x2) A1(1,1)*x1 + A1(1,2)*x2; % dx/dt = a11*x1+ a12*x2
fx2 = @(x1, x2) A1(2,1)*x1 + A1(2,2)*x2; % dy/dt = a21*x1 + a22*x2

x_range = -5:0.5:5;
y_range = -5:0.5:5;
N = 1:100;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx1, fx2, x_range, y_range, N, f1);

%% example b)
A2 = [3 -4; 2 -1];
f2 = '$\dot{x} = (3 \hspace*{1mm} -4; 2 \hspace*{1mm} -1)x$';
fx1 = @(x1, x2) A2(1,1)*x1 + A2(1,2)*x2; 
fx2 = @(x1, x2) A2(2,1)*x1 + A2(2,2)*x2; 

x_range = -5:0.55:5;
y_range = -5:0.55:5;
N = 1:100;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx1, fx2, x_range, y_range, N, f2);

%% example c)
A3 = [-3 -2; -1 -3];
f3 = '$\dot{x} =(-3\hspace*{1mm} -2;-1\hspace*{1mm} -3)x$';
fx1 = @(x1, x2) A3(1,1)*x1 + A3(1,2)*x2;
fx2 = @(x1, x2) A3(2,1)*x1 + A3(2,2)*x2;
% [x1, x2] = find_roots(A);

x_range = -5:0.55:5;
y_range = -5:0.55:5;
N = 1:100;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx1, fx2, x_range, y_range, N, f3);

%% example d)
A4 = [2 0; 0 2];
f4 = '$\dot{x} = (2\hspace*{1mm} 0; 0\hspace*{1mm} 2)x$';
fx1 = @(x1, x2) A4(1,1)*x1 + A4(1,2)*x2; 
fx2 = @(x1, x2) A4(2,1)*x1 + A4(2,2)*x2;

x_range = -5:0.5:5;
y_range = -5:0.5:5;
N = 1:100;
delta_t = 0.1;

plot_phase_portrait(delta_t, fx1, fx2, x_range, y_range, N, f4);

%% Tr Det plot
As = cat(3, A1, A2, A3, A4);
det_tr_plot(As)

function [sol_x1, sol_x2] = find_roots(A)
    syms x1 x2
    eq1 = A(1,1)*x1 + A(1,2)*x2 == 0;
    eq2 = A(2,1)*x1 + A(2,2)*x2 == 0;
    sol = solve([eq1, eq2], [x1, x2]);
    sol_x1 = sol.x1;
    sol_x2 = sol.x2;
end

function det_tr_plot(A)
    set(groot, 'defaultTextInterpreter', 'latex')
    set(groot, 'defaultLegendInterpreter', 'latex')
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
    set(groot, 'DefaultFigureColor', 'w')

    figure;
    hold on;

    Tr = [];
    Det = [];
    labels = {};
    num_matrices = size(A, 3);
    colors = lines(size(A, 3));

    for i = 1:num_matrices
            current_A = A(:,:,i);
            Tr(end+1) = trace(current_A);
            Det(end+1) = det(current_A);
            labels{end+1} = sprintf('$A_%d$', i);
            scatter(Tr(end), Det(end), 20, 'filled', 'MarkerFaceColor', colors(i,:), 'MarkerEdgeColor', 'k', 'DisplayName', labels{end});
    end
  
    Tr_range = linspace(min(Tr)-1, max(Tr)+1, 100);
    D_curve = (Tr_range.^2) / 4;
    plot(Tr_range, D_curve, 'b--', 'LineWidth', 1.0, 'DisplayName', '$D = \frac{Tr^2}{4}$');
    
    ax = gca;                   
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';

    xlabel('Tr(A)')
    ylabel('Det(A)')
    legend('Location', 'best', 'Interpreter', 'latex')
    box on
    grid on
    hold off
end