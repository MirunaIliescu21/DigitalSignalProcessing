function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  [num_clients, num_themes] = size(mat);
  valid_indices = []; % vector de indici
  
  % Pentru fiecare client numar recenziile diferite de 0
  for i = 1:num_clients
    diff_zero = 0;
    for j = 1:num_themes
      if mat(i, j) ~= 0
          diff_zero = diff_zero + 1;
      endif
    endfor
      
    % Verific daca clientul are suficiente recenzii
    if diff_zero >= min_reviews
        % Adaug indicele clientului la vectorul de indici valizi
        valid_indices = [valid_indices, i];
    endif
  endfor
  
  % Construiesc o noua matrice doar din coloanele clientiilor cu indici valizi
  reduced_mat = mat(valid_indices, :);
end
