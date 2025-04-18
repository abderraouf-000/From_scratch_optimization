function [xk_next,iterates,taylor,taylors_xs] = multivariable_newtons_method(x0,f,df,ddf,iterations)

% x0 : starting point vector.
% f : The objective function to minimize.
% df : The function's gradient vector  -> [df/dx(1);df/dx(2)].
% ddf : The function's hessian square matrix -> [df^2/dx1^2;df^2/dx2^2, df^2/dx1x2; df^2/dx2x1]
% (It should be no-singular to be invertible, positive definite).

xk_next = x0;
for k=1:iterations
    df_value = df(xk_next);
    ddf_value = ddf(xk_next);
    xk_next = xk_next - ddf_value\df_value;
    display(xk_next);
end

end