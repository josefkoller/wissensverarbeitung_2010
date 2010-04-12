function [ gradient ] = f_gradient()
    syms x;
    syms y;
    z = f(x, y);

    fx = diff(z, x);
    fy = diff(z, y);

    gradient = matlabFunction(fx, fy);
end

