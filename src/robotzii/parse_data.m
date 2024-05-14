function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % Deschid fisierul pt citire
    file_name = fopen(filename, 'r');

    % Citesc variabilele 
    n = fscanf(file_name, '%d', 1); % Citesc intregul n
    x = fscanf(file_name, '%d', n + 1); % Citesc n+1 intregi
    y = fscanf(file_name, '%d', n + 1); % Citesc n+1 intregi

    % Inchid fisierul
    fclose(file_name);
end