function [] = plot_curves_and_mse(x, y_learned, x_train, y_train, ...
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
          
    do_plot_mse = true;
    if(do_plot_mse)  
        mse_train = sum((y_train - sim(net, x_train)).^2) / length(x_train);
        mse_test = sum((y_test - sim(net, x_test)).^2) / length(x_test);
        figure; 
        hold on; 
         
        plot(mse_train, 'r');
        title(sprintf('%s MSE over the used epoch count - training data', title_front));
        ylabel('Mean Squared Error with Regularization (msereg)');
        xlabel('Epochs');
      
        plot(mse_test, 'r');
        title(sprintf('%s MSE over the used epoch count - test data', title_front));
        ylabel('Mean Squared Error with Regularization (msereg)');
        xlabel('Epochs');
      
        legend('MSE training data', 'MSE test data');
        hold off;
      
        print('-dpng', '-r300', sprintf('plot_%s_%d_mse.png', ...
            plot_filename_prefix, index));
    end
end
