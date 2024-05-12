function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  % Normalizez A si B
  A = A / max(abs(A));
  B = B / max(abs(B));
  norm_A = norm(A, 2);
  norm_B = norm(B, 2);
  % Calculez produsul scalar intre A si B
  dot_product = A' * B;
  % Calculez asemanarea cosinusului
  similarity = dot_product / (norm_A * norm_B);
end
