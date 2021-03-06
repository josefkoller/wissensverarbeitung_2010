% plot_curves
function [] = plot_curves(x, y_learned, x_train, y_train, ...
    figure_title, plot_filename_prefix)
    figure;
      
    hold on;
    plot(x_train, y_train, 'g.');
    title(figure_title);   
    plot(x, y_learned, 'm'); 
    xlabel('x');
    ylabel('y');
      
    legend('training data', 'learned data');
    hold off;
      
    print('-dpng', '-r300', sprintf('plot_%s_xy_curves.png', ...
       plot_filename_prefix));
end
