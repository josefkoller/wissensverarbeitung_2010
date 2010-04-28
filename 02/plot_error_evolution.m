function [ ] = plot_error_evolution( w0, eta_list )
    numIter = 100;
    error_list = zeros(length(eta_list), numIter);
    colors = ['g', 'r', 'b', 'm'];
    
    for eta_index = 1:length(eta_list)
        subplot(2, 2, eta_index);
        eta = eta_list(eta_index);
        [weights, error] = gradientDescentHw2(w0, numIter, eta);
        plotErrorFunction(weights);
        title1 = title(sprintf('error surface for eta %0.1f', eta));
        set(title1, 'FontSize', 18)
        error_list(eta_index, :) = error;
    end

    figure;
    hold on;
    title('error evolution');

    for error_index = 1:length(error_list)
        error = error_list(error_index, :);
        color = colors(error_index);
        plot(1:numIter, error, color);
        xlabel('iteration');
        ylabel('error');

        text = 'eta=%0.2f';
        legend(sprintf(text, eta_list(1)), sprintf(text, eta_list(2)), ...
        sprintf(text, eta_list(3)), sprintf(text, eta_list(4)) );
    end
    hold off;
end

