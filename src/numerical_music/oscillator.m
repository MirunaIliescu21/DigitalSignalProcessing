function x = oscillator(freq, fs, dur, A, D, S, R)
  % Calculam numarul total de esantionare = durata * frecventa
  total = round(dur * fs);

  % Creez vectorul de timp echidistant cu durata semnanului de 1/fs
  t = (0 : total - 1) / fs;
  % Calculez unda sinusoidala conform formulei din cerinta
  sine_wave = sin(2 * pi * freq * t);
  
  % Calculez numarul de esantionare pentru fiecare faza:
  % attack, decay, sustain, release
  attack_samples = int64(floor(A * fs));
  decay_samples = int64(floor(D * fs));
  release_samples = int64(floor(R * fs));
  sustain_samples = max(0, total - (attack_samples + decay_samples + release_samples));

  % Calculez envelope-urile
  attack_envelope = linspace(0, 1, double(attack_samples));

  sustain_level = S;
  decay_envelope = linspace(1, sustain_level, double(decay_samples));

  sustain_envelope = sustain_level * ones(1, sustain_samples);

  release_envelope = linspace(sustain_level, 0, double(release_samples));

  % Concatenez envelope-urile
  envelope = [attack_envelope, decay_envelope, sustain_envelope, release_envelope];

  % Ajustez lungimea envelope-ului la totalul de esantioane,
  % adaugand sau eliminand esantioane la nevoie
  n = length(envelope);
  if n > total
    envelope = envelope(1 : total);
  elseif n < total
    envelope = [envelope zeros(1, total - n)];
  endif

  % Generez semnalul final multiplicand unda sinusoidala cu envelope-ul
  x = sine_wave .* envelope;
  % Traspun  vectorul
  x = x';

endfunction

