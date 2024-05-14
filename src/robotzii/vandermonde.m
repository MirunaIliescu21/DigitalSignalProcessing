function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % Calculez coeficientii Vandermonde
    n = length(x);
    V = zeros(n, n);
    for i = 1:n
        V(:, i) = x.^(i-1);
    end

    coef = V \ y;
endfunction
