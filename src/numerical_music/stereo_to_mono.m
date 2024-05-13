function mono = stereo_to_mono(stereo)
  % Functia mean calculeaza media de pe fiecare coloana (= arg '2')
  % a matriciei stereo -> un semnal mono
  mono = mean(stereo, 2);

  % Normalizez vectorul mono
  mono = mono / max(abs(mono));
endfunction

