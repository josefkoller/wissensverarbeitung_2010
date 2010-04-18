% K scalar number of outputs
% M scalar number of hidden units
% w matrix weights KxM
% my vector weights M
% x scalar input
function [ result ] = z( K, M, w, my, x )
    result = zeros(K);
    for k = 1:(K+1)
        argument = 0;
        for j = 1:(M+1)
            argument = argument + w(k, j) * exp((x - my(j))^2);
        end
        result(k) = tanh(argument);
    end
end

