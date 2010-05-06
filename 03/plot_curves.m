function [] = plot_curves(x, y_learned, x_train, y_train, ...
    title_front, plot_filename_prefix, index, net, x_test, y_test)
    figure;
      
    hold on;
    plot(x_train, y_train, 'g.');
    title(sprintf('%s x and y training data', title_front));
    xlabel('x training');
    ylabel('y training');
   
    plot(x, y_learned, 'm'); 
    title(sprintf('%s x=0:0.05:7 and y-learned', title_front));
    xlabel('x');
    ylabel('y learned');
      
    legend('training data', 'learned data');
    hold off;
      
    print('-dpng', '-r300', sprintf('plot_%s_%d_xy_curves.png', ...
       plot_filename_prefix, index));
end
