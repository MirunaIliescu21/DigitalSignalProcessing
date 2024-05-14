function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% TOOD 1: si(xi) = yi, i = 0 : n - 1

	% TODO 2: s_n-1(xn) = yn

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1

	% TODO 6: s0''(x0) = 0

	% TODO 7: s_n-1''(x_n) = 0

	% Solve the system of equations
    % Remember that the indexes in Matlab start from 1, not 0

    n = length(x) - 1; % Numarul punctelor de date - 1

	A = zeros(4*n, 4*n);
	b = zeros(4*n, 1);

	% Pasul 1: Interpolarea conditiilor
	for i = 1:n
        b(i) = y(i);
        A(i, 4*(i - 1) + 1) = 1;
    endfor

	% Pasul 2: Conditia de frontiera naturala
	% Se seteaza volorile pt primele 2 ecuatii:
	%	(s_i(x_i) = y_i) pentru toate punctele de date (i = 0 pana la n-1).
	%	(s_{n-1}(x_n) = y_n).
	A(n + 1, 4*(n - 1) + 1) = 1; % fiecare coeficient al lui a0, a1... este 1
    b(n + 1) = y(n + 1);

	% Calculez fiecare element de de pe ultima linie A(n+1, :) folosind
	% puteri succesive ale diferentei dintre ultimul si penultimul pct x
    p = 1;
    for i = ((n - 1) * 4 + 2) : n * 4
        A(n + 1, i) = (x(n + 1) - x(n)) .^ p;
		% cresc puterea la fiecare iteratie
        p = p + 1;
    endfor

	% Pasul 3: Construirea matricei pentru ecuatii spline
    k = 2; % k asigura pozitia corecta atunci cand inserez valori in A

    for i = 1:(n - 1)
		% calculez diferenta dintre coordonatele x ale pctului de date urmator
		% si cel curent
		% utilizez dif pt a calcula coeficientii spline-ului cubic
        dif = x(i + 1) - x(i);

        A(i * 3 + n - 1, (4*(i - 1) + 1) : (4 * k)) = [1 dif dif*dif dif .^ 3 -1 0 0 0];
        A(i * 3 + n, 4 * (i - 1) + 1:4 * k) = [0 1 2*dif 3 * dif *dif 0 -1 0 0];
        A(i * 3 + n + 1, 4*(i - 1) + 1:4 * k) = [0 0 2 6 * dif 0 0 -2 0];

        k = k + 1;
    endfor

    % Pasul 4: Conditii de frontiera naturala
	% acest pas asigura faptul ca a doua derivata a doua este 0 
	% s_n-1''(x_n) = 0
    A(n + 1 + 3 * (n - 1) + 1, 1:4) = [0 0 2 0];
	% calculez diferenta dintre coordonata x a ultimului pctului de date
	% si a celui precedent
    dif_n = x(n + 1) - x(n);
    A(n + 1 + 3 * (n - 1) + 2, 4 * (n - 1) + 1:4 * n) = [0 0 2 6 * dif_n];

	% Factorizez matricea A
    [L, U, P] = lu(A);

    % Rezolv sistemul de ecuatii folosind factorizarea LU
    y = P * b;
    z = L \ y;
    coef = U \ z;

end

