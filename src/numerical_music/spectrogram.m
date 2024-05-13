function [S f t] = spectrogram(signal, fs, window_size)
  % Calculez lungimea semnalului
  [signal_length, ~] = size(signal);
  % Pentru a determina nr de ferestre care trebuie sa fie un nr intreg,
  % folosesc functia floor
  nr_windows = floor(signal_length / window_size);

  % Initializez matricea
  S = zeros(window_size, nr_windows);

  % Calculez vectorul de frecventa
  f = zeros(window_size, 1);
  for i = 1:window_size
    f(i) = (i - 1) * fs / window_size;
    f(i) = f(i) / 2;
  endfor 

  % Initializez vectorul de timp
  t = zeros(nr_windows, 1);

  % Pentru fiecare ferestrea calculez urmatoarele:
  for i = 1:nr_windows
    % Calculez indicii
    start_index = (i - 1) * window_size + 1;
    end_index= start_index + window_size - 1;

    % Extrag segmentul de lungime window size
    segment = signal(start_index:end_index);

    % Aplic functia Hann
    window = hanning(window_size);
    windowed_signal = segment .* window;

    % Calculez Transforma Fourier cu o rezolutie dubla
    windowed_signal_fft = fft(windowed_signal, 2 * window_size);
    windowed_signal_fft = windowed_signal_fft(1:window_size);
    
    % Stochez rezultatul in matricea spectrograma
    abs_fft = abs(windowed_signal_fft);
    S(:, i) = abs_fft;

    % Calculez vectorul de timp
    t(i) = (i - 1) * (window_size / fs);
  endfor
  S
  f
  t
endfunction