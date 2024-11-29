%% exercise 1 complex_systems laboratory project 2
set(groot, 'defaultTextInterpreter' , 'latex')
set(groot, 'defaultLegendInterpreter' , 'latex')
set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
set(groot, 'DefaultFigureColor' , 'w' )

x = [-0.1 0.1 0.4 0.9 1.1 1.4 1.9 2.1];
N = 1:40;
delta_t = [0.1 0.4 0.8];

for i = 1:length(delta_t)
    figure;
    label = sprintf('$\\Delta t = %.1f$', delta_t(i));
    T = delta_t(i):delta_t(i):length(N)*delta_t(i);
    for j = 1:length(x)
        X = zeros(length(N), 1);
        X(1) = x(j);
        for n = 1:length(N)-1
            X(n+1) = next_term(X(n), delta_t(i));
        end
    plot(T, X);
    xlim([delta_t(i) 4.0])
    ylim([-4.0 6.0])
    xlabel('t')
    ylabel('x(t)')
    grid on;
    hold on
    title(label)
    end
    hold off;
end

function [y] = f(x)
    y = x*(x-1)*(x-2); % roots for x = [0 1 2]
end

function [xn_plus_1] = next_term(xn, delta_t)
    xn_plus_1 = xn + delta_t*f(xn);
end