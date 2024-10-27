# Digital Signal Processing and Data Analysis with MATLAB
Check out the checker instructions [here](https://mn.pages.upb.ro/2023-2024/tema2/tema2-statement/intro).
## Description

This project involves implementing and analyzing various digital signal processing (DSP) techniques and interpolation methods using MATLAB. The project covers audio signal sampling, conversion between stereo and mono, visualizations of sound through spectrograms, artificial sound generation, and audio filtering. Additionally, the project explores cubic spline interpolation and data analysis using the cosine similarity for recommendations.

## Task 1

### Explanation of Concepts in Task 1

#### Storing an Analog Signal

An analog signal can be digitally stored through sampling and quantization. Sampling captures the values of the signal at regular time intervals, while quantization rounds these values to the nearest permitted number based on digital resolution. Digital storage enables manipulation and processing of audio signals on computers.

#### Stereo and Mono - Function `stereo_to_mono.m`

- **Mono:** Sound is captured and played back through a single audio channel. While simple and storage-efficient, it lacks spatial dimension.
- **Stereo:** A stereo signal uses two audio channels—one for the left ear and one for the right—creating an illusion of spatial depth, essential for immersive audio experiences.

#### Visualizing Sound

- **Spectrogram:** A spectrogram is a graph that represents the frequencies of an audio signal over time. The "spectrogram" function is essential in audio signal analysis, allowing us to visualize how the frequencies of a signal change over time. This is crucial in many applications, including music, speech recognition, and audio diagnostics.

#### Creating Artificial Sounds

- **Oscillators:** Oscillators generate periodic waveforms, such as sine, square, triangular, and sawtooth waves. They are fundamental in synthesizing sounds, especially in electronic music.

#### Applying Audio Filters

- **Filters:** Filters are tools used to modify the frequencies in an audio signal. They can be used to reduce noise, shape tones, and create special effects.

### Function Results from `studio.m`

The results of the functions within `studio.m` illustrate different spectrogram analyses and filter effects applied to various sounds.

#### Spectrogram for "Plain Loop"
Using the `spectrogram` function, a spectrogram of the audio in 'loop.wav' shows the structure of varied frequencies throughout the recording, revealing a mix of frequencies.

#### Spectrogram for "Plain Sound"
The spectrogram of the sound generated from 'music1.csv' shows a different frequency distribution than "Plain Loop." This variation is due to the frequencies and amplitudes in the two signals.

#### Spectrogram for "Low Pass Sound"
After applying a low-pass filter, the spectrogram shows a significant reduction in higher frequencies, confirming that the filter successfully eliminated frequencies above 1000 Hz, retaining only the lower frequencies.

#### Spectrogram for "Reverb Sound"
Applying reverb creates an extended frequency presence over time. This is visible as a temporal spread of frequency components in the spectrogram.

#### Spectrogram for "Tech"
The spectrogram of 'tech.wav' shows a complex frequency distribution typical of a technological or electronic sound.

#### Spectrogram for "Low Pass Tech"
Low-pass filtering of the 'tech.wav' signal results in a reduction of high frequencies, with the spectrogram displaying primarily lower frequencies.

#### Spectrogram for "Reverb Tech"
The reverb effect adds temporal extension to the frequency components, visible as stretched frequencies along the time axis.

#### Spectrogram for "Low Pass + Reverb Tech"
The "Low Pass + Reverb Tech" spectrogram shows low frequencies extended temporally after the reverb effect is applied to the low-pass filtered signal.

#### Spectrogram for "Reverb + Low Pass Tech"
When reverb is applied first, followed by low-pass filtering, subtle differences in frequency clarity are observed due to the filtering effect following reverberation.

### Conclusions
- The `low_pass` filter effectively removes high frequencies, retaining only the lower ones.
- The reverb effect adds persistence to the sound, creating a temporal extension visible in the spectrogram.
- The order of effects (low-pass and reverb) can subtly influence the final outcome.

## Task 2

### Cubic Spline Interpolation

The `spine_c2` function performs natural cubic spline interpolation by solving a linear system of equations. Key steps of the algorithm include:

1. **Initial Condition Interpolation**  
   Ensures smooth transitions between data points.

2. **Matrix Construction**  
   Builds the matrix to satisfy cubic spline interpolation requirements.

3. **Natural Boundary Conditions**  
   Applies conditions to ensure a smooth curve throughout intervals.

### Vandermonde Coefficients

The `vandermonde(x, y)` function creates a Vandermonde matrix, where each column contains powers of vector `x`. This matrix is used to determine the polynomial interpolation coefficients, which are then used to interpolate values.

## Task 3

### Preprocessing

The `preprocess.m` function reduces data volume by removing rows (clients) who have provided fewer reviews than a specified threshold `min_count`.

### Cosine Similarity

Cosine similarity is a measure of similarity between two non-zero vectors, defined by the cosine of the angle between them. The `cosine_similarity.m` function calculates this similarity between two normalized column vectors.

### Recommendations

The `recommendations.m` function generates recommendations based on a theme that a user has liked. This function uses SVD decomposition to reduce data complexity and identify relevant features. The reduced data is then analyzed to determine similarity and suggest relevant themes.
