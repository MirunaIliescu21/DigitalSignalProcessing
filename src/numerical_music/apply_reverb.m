function signal = apply_reverb(signal, impulse_response)
  % Convertesc semnalul cu ajutorul functiei calculate anterior
  impulse_response_mono = stereo_to_mono(impulse_response);
  
  % Calculez produsul de convolutie dintre semnal si impuls
  convolved_signal = fftconv(signal, impulse_response_mono);
  
  % Normalizez rezultatul
  signal = convolved_signal / max(abs(convolved_signal));
endfunction

