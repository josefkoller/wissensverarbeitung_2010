function [ result ] = f( w1, w2 )
    function1 = -2 * exp(-5 * ...
        (0.5 * (w1 - 1).^2 + (w2 - 1).^2));
    function2 = - exp(-0.1* ...
        (4 * (w1 + 1).^2 + 0.5 * w2.^2));
    result = function1 + function2;
end