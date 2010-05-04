% problem 3.2

clear all;
close all;

load('neuralnetworks.mat');

x_test = x_test';
y_test = y_test';
x_train = x_train';
y_train = y_train';

TestSet.P = x_test;
TestSet.T = y_test;

x = -2:0.01:2;

n = 8;
alpha = [0.9 0.95 0.975 0.99 0.995 1.0];
for index = 1:6
   net = newff([-2 2], [n, 1], {'logsig', 'purelin'}, 'trainscg');
   net.performFcn = 'msereg';
   net.trainParam.epochs = 700;
   net.trainParam.show = NaN;
   net.performParam.ratio = alpha(index);
   net = init(net);
   plotbrowser;
   [net, perf] = train(net, x_train, y_train, [],[],[], TestSet);
   
   mseTrain = sum((y_train - sim(net, x_train)).^2) / length(x_train);
   mseTest = sum((y_test - sim(net, x_test)).^2) / length(x_test);

   fprintf('%f Alpha: %f mse on training set, %f mse on testset\n', alpha(index), mseTrain, mseTest);

   figure;
   clf reset

   y_learned = sim(net, x);

   %plot(x,y);
   hold on;
   plot(x_train, y_train, 'g.');
   plot(x, y_learned, 'm'); 

   title(sprintf('%f Alpha', alpha(index)));  
   
   figure;
   hold on;
   plot(perf.perf, 'r');
   plot(perf.tperf, 'b');
   ylabel('Mean Squared Error with Regularization (msereg)');
   xlabel('Epochs');
   legend('Test', 'Train');
   print('-dpng', '-r300', sprintf('plot_3_2_%d.png', index));
   hold off;
end
