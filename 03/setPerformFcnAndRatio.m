function [ net] = setPerformFcnAndRatio( net, fcn_name, ratio )
    net.performParam.ratio = ratio;
    net.performFcn = fcn_name;
    return net;
end

