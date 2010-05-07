function [ x_test, y_test, x_train, y_train, TestSet, x_min, x_max, x_step] = load_input()
    load('neuralnetworks.mat');

    x_test = x_test';
    y_test = y_test';
    x_train = x_train';
    y_train = y_train';

    TestSet.P = x_test;
    TestSet.T = y_test;

    x_min = 0;
    x_max = 7;
    x_step = 0.05;
end
