% plot_error
function [] = plot_error(error_test, error_training, ...
    figure_title, x_label, plot_filename_prefix, x)
    figure;
     
    if exist('x', 'var')
        plot(x, error_training, 'r');
    else
        plot(error_training, 'r');
    end

    title(figure_title);
    ylabel('Error');
    xlabel(x_label);
  
    hold on; 
    
    if exist('x', 'var')
        plot(x, error_test, 'b');
    else
        plot(error_test, 'b');
    end
    
    ylabel('Error');
    xlabel(x_label);
  
    legend('training data', 'test data');
    hold off;
  
    print('-dpng', '-r300', sprintf('plot_%s_error.png', ...
        plot_filename_prefix));
end
