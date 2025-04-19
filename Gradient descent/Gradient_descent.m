function [x_next] = Gradient_descent(x0,f,df,~,iterations)

x_next = x0;
rho=0.5;  %For the Armijo LS; usually 0.5 or 0.9
c=0.2;  %For the Armijo LS; usually 0.01 or 0.2
alpha = 0.0038;  %Initial step length for the Armijo LS(!!)

for k=1:iterations
    df_x = df(x_next);
    direction = -df_x/norm(df_x);
    gamma = armijo_ls(f, df, direction, x_next, alpha, rho, c);
    x_next = x_next + gamma * direction;
    display(gamma);
end