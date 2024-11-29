function plot_phase_portrait(delta_t, fx, fy, x_range, y_range, N, f_equation, use_pi_axis)
    set(groot, 'defaultTextInterpreter' , 'latex')
    set(groot, 'defaultLegendInterpreter' , 'latex')
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
    set(groot, 'DefaultFigureColor' , 'w' )

    [X_grid, Y_grid] = meshgrid(x_range, y_range);
    U = fx(X_grid, Y_grid);
    V = fy(X_grid, Y_grid);

    % Normalize the vectors for uniform arrow size
    magnitude = sqrt(U.^2 + V.^2);
    
    magnitude(magnitude == 0) = 1;
    U_norm = U ./ magnitude;
    V_norm = V ./ magnitude;

    % Define a fixed arrow length
    arrow_length = 0.6; % Adjust as needed

    figure;
    hold on;
    quiver(X_grid, Y_grid, U_norm, V_norm, arrow_length, 'k', 'LineWidth', 0.6, 'MaxHeadSize', 1, 'HandleVisibility', 'off');

    m_values = -2:0.5:2;

    isoclines = arrayfun(@(m) @(x1, x2) fy(x1, x2) - m .* x2, m_values, 'UniformOutput', false);

    cellfun(@(iso_fun) fimplicit(iso_fun, [min(x_range), max(x_range), min(y_range), max(y_range)], 'b--'), isoclines);
   
    for i = 1:length(x_range)
        for j = 1:length(y_range)
            X = zeros(length(N), 1);
            X(1) = x_range(i);
            Y = zeros(length(N), 1);
            Y(1) = y_range(j);
            for n = 1:length(N)-1
                [X(n+1), Y(n+1)] = next_terms(delta_t, fx, fy, X(n), Y(n));
            end
            plot(X, Y, 'r');
        end
    end

    if nargin > 7 && use_pi_axis
        xticks = x_range(1):pi:x_range(end);
        xticklabels = arrayfun(@(x) pi_label(x), xticks, 'UniformOutput', false);
        set(gca, 'XTick', xticks, 'XTickLabel', xticklabels, 'TickLabelInterpreter', 'latex');
    end

    xlabel('$x$');
    ylabel('$\dot{x}$');
    xlim([x_range(1) x_range(end)])
    ylim([y_range(1) y_range(end)])
    title(f_equation)
    grid on;
    hold off;
end


function [x_next_term, y_next_term] = next_terms(delta_t, fx, fy, xn, yn)
    kx = delta_t * fx(xn ,yn);
    ky = delta_t * fy(xn ,yn);

    x_next_term = xn + delta_t * fx(xn + kx/2, yn + ky/2);
    y_next_term = yn + delta_t * fy(xn + kx/2, yn + ky/2);
end

function label = pi_label(x)
    % Generate LaTeX-formatted labels in terms of pi
    n = x / pi;
    if abs(n - round(n)) < 1e-6
        n = round(n);
        if n == 0
            label = '$0$';
        elseif n == 1
            label = '$\pi$';
        elseif n == -1
            label = '$-\pi$';
        else
            label = sprintf('$%d\\pi$', n);
        end
    else
        [num, den] = rat(n, 1e-6);
        if num == 1
            label = sprintf('$\\frac{\\pi}{%d}$', den);
        elseif num == -1
            label = sprintf('$-\\frac{\\pi}{%d}$', den);
        else
            label = sprintf('$\\frac{%d\\pi}{%d}$', num, den);
        end
    end
end