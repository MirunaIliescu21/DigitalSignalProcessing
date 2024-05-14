function y_interp = P_spline(coef, x, x_interp)
	% Calculez numarul de subintervale
    n = length(x) - 1;
	% initializez vectorul rezultat al interpolarii
    y_interp = zeros(size(x_interp));

    % Iterez prin interpolara
    for i = 1:length(x_interp)
        % Gasesc intervalul corespunzator pentru x_interp(i)
        interval_index = find(x_interp(i) >= x(1:end-1) & x_interp(i) <= x(2:end), 1, 'first');

        % Extrag coeficientii pentru intervalul gasit
        a = coef(4*(interval_index-1) + 1);
        b = coef(4*(interval_index-1) + 2);
        c = coef(4*(interval_index-1) + 3);
        d = coef(4*(interval_index-1) + 4);

        % Calculez valoarea interpolata pentru x_interp(i)
        h = x_interp(i) - x(interval_index);
        y_interp(i) = a + b*h + c*h^2 + d*h^3;
    endfor
end

