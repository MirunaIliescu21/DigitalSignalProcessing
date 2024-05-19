function y_interp = P_vandermonde (coef, x_interp)

    n = length(coef);
    % Initializez vectorul rezultat al interpolarii
    y_interp = zeros(size(x_interp));

    for i = 1:length(x_interp)
        y_interp(i) = 0;
        % Calculez valoarea interpolata pentru x_interp(i)
        for j = 1:n
            y_interp(i) = y_interp(i) + coef(j) * x_interp(i)^(j-1);
        end
    end
end
