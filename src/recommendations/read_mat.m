function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  % Citesc fisierul CSV
  data = csvread(path);
  % Construiesc matricea fara headere
  mat = data(2:end, 2:end);
end
