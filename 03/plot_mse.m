function [] = plot_mse(neuron_number, mse_train_list, mse_test_list, plot_filename_prefix)
    clf reset; 
    
     
    plot(mse_train_list, 'r');
    title('MSEs over the used neuron count');
    ylabel('Mean Squared Error');
    xlabel('# neuron');
  
    hold on; 
    plot(mse_test_list, 'b');
    ylabel('Mean Squared Error');
    xlabel('# neuron');
  
    legend('MSE training data', 'MSE test data');
    hold off;
  
    print('-dpng', '-r300', sprintf('plot_%s_mse.png', ...
        plot_filename_prefix));
end