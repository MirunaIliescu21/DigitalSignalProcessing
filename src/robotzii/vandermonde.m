function coef = vandermonde(x, y)

    % Calculez coeficientii Vandermonde
    n = length(x);
    V = zeros(n, n);
    for i = 1:n
        V(:, i) = x.^(i-1);
    end

    coef = V \ y;
endfunction
