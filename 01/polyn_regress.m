clear all;
close all;

load('linearregression_homework.mat');

l = 0:6;

calculate_plot( l,x_train,y_train );
calculate_plot( l,x_test,y_test,y_test_nonoise );
%We will choose the degree 2 

