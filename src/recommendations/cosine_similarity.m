function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  % Calculez produsul scalar intre A si B
  dot_product = sum(A .* B);
  
  % Calculez normele lui A si B
  norm_A = sqrt(sum(A .^ 2));
  norm_B = sqrt(sum(B .^ 2));
  
  % Calculez asemanarea cosinusului 
  similarity = dot_product / (norm_A * norm_A);
end
