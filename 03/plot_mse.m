function [] = plot_mse(neuron_number, mse_train_list, mse_test_list, plot_filename_prefix)
    clf reset; 
    
    hold on; 
     
    plot(1:neuron_number, mse_train_list, 'r');
    title('MSE over the used neuron count - training data'));
    ylabel('Mean Squared Error with Regularization (msereg)');
    xlabel('# neuron');
  
    plot(neuron_numbers, mse_test_list, 'b');
    title('MSE over the used neuron count - test data');
    ylabel('Mean Squared Error with Regularization (msereg)');
    xlabel('# neuron');
  
    legend('MSE training data', 'MSE test data');
    hold off;
  
    print('-dpng', '-r300', sprintf('plot_%s_mse.png', ...
        plot_filename_prefix));
end