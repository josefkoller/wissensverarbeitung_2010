function [] = plot_error(error_test, error_training, ...
    figure_title, x_label, plot_filename_prefix)
    figure;
     
    plot(error_training, 'r');
    title(figure_title);
    ylabel('Error');
    xlabel(x_label);
  
    hold on; 
    plot(error_test, 'b');
    ylabel('Error');
    xlabel(x_label);
  
    legend('training data', 'test data');
    hold off;
  
    print('-dpng', '-r300', sprintf('plot_%s_error.png', ...
        plot_filename_prefix));
end
