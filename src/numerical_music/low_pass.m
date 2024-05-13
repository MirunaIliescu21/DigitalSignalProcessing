function signal = low_pass(signal, fs, cutoff_freq)
  % Transformarea Fourier a semnalului signal
  fourier = fft(signal);
  
  % Calculez vectorul de frecventa
  total = length(signal);
  f = (0 : total - 1) * fs / total;
  
  % Creez o masca pt filtru
  mask = f <= cutoff_freq;
  
  % Calculez produsul Hadamard intre transf Fouriei si masca
  fourier_filtered = fourier .* mask';
  
  % Calculez inversa transformatei Fourier
  filtered_signal = ifft(fourier_filtered);
  
  % Normalizez semnalul
  signal = filtered_signal / max(abs(filtered_signal));
endfunction
