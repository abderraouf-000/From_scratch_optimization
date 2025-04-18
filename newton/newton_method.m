function [xk_next,iterates,taylor,taylors_xs] = newton_method(x0,f,df,ddf,iterations)

% x0 : arbitrary algorithm's starting point.
% df : the first derivative of the objective function f.
% ddf : the second derivative of the objective function f.
% xk_next : minimum estimation
% Intuition behind newton's :
% we approximate the function locally in the neighborhood of xk or the
% current iterate, then we try to find the minimizer of this function (local minimizer)
% At the first iterate, we want to visualize the function approximation


iterates = x0;

xk_next = x0;

taylors_xs = linspace(xk_next-1,xk_next+1,50);

taylor = zeros(1, length(taylors_xs));

for j = 1:length(taylors_xs)
taylor(j) = f(xk_next) + (taylors_xs(j) - xk_next) * df(xk_next) + ...
                    0.5 * (taylors_xs(j) - xk_next)^2 * ddf(xk_next);
end


for k = 1:iterations
    df_value = df(xk_next);
    ddf_value = ddf(xk_next);
    xk_next = xk_next - (df_value ./ ddf_value);
    iterates(end+1) = xk_next; % for visualization
end
    
end


% x = linspace(-20,20, 400);
% plot(x, f(x), 'b', 'LineWidth', 2);
% title('Graph of f(x) = x^2 + 2x + 1')
% xlabel('x')
% ylabel('f(x)')
% hold on
% y_points = f(iterates);
% plot(iterates, y_points, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
% hold on;
% plot(taylors_xs, taylor, 'y', 'lineWidth', 2);