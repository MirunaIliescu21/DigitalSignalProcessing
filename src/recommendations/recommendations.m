function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  reduced_mat = preprocess(mat, min_reviews);
  % Calculez descompunerea SVD a matriciei
  [U, S, V] = svds(reduced_mat, num_features);

  % Calculez similaritatea intre tema apreciata si oricare alta tema
  similarities = zeros(1, size(V, 1));
  for i = 1:size(V, 1)
    similarities(i) = cosine_similarity(V(liked_theme, :)', V(i, :)');
  end

  % Sortez temele dupa similiaritate si tin minte indicii initiali
  [sorted_similarities, sorted_indices] = sort(similarities, 'descend');

  % Extrag primii num_recoms ai temelor recomandate
  recoms = sorted_indices(2:(num_recoms + 1))
end
