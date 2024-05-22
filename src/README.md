# TEMA 2 - METODE NUMERICE

ILIESCU MIRUNA ELENA - 312CA

## DESCRIERE

### TASK 1

#### Explicatia conceptelor din acest task

##### STOCAREA UNUI SEMNAL ANALOGIC

Un semnal analogic poate fi stocat digital prin eșantionare și
cuantizare. Eșantionarea constă în capturarea valorilor semnalului
la intervale regulate de timp, iar cuantizarea în rotunjirea acestor
valori la cel mai apropiat număr permis de rezoluția digitală.
Stocarea digitală facilitează manipularea și prelucrarea semnalelor
audio pe calculator.

##### STEREO ȘI MONO - funcția `stereo_to_mono.m`

Mono: Sunetul este capturat și redat printr-un singur canal audio.
Este simplu și eficient din punct de vedere al stocării, dar poate fi
lipsit de spatialitate.

Stereo: În schimb, un semnal stereo utilizează două canale audio, unul
pentru urechea stângă și unul pentru urechea dreaptă, creând astfel o
iluzie de spațialitate și adâncime a sunetului. Acest lucru este esențial
pentru o experiență audio imersivă.

##### VIZUALIZAREA SUNETULUI

Spectrograma: Este un grafic care reprezintă frecvențele unui semnal
audio în funcție de timp. Funcția "spectrogram" este esențială pentru
analiza semnalelor audio, permițându-ne să vizualizăm cum variază în timp
frecvențele unui semnal. Acest lucru este crucial în multe aplicații,
inclusiv în muzică, recunoașterea vorbirii și diagnosticarea problemelor
audio.

##### CREAREA SUNETELOR ARTIFICIALE

Oscilatoare: Sunt dispozitive sau algoritmi care generează forme de undă
periodice. Formele de undă comune includ semnale sinusoidale, pătrate,
triunghiulare și dinți de fierăstrău. Acestea sunt fundamentale pentru
sinteza sunetelor în muzica electronică.

##### APLICAREA FILTRELOR AUDIO

Filtre: Sunt instrumente utilizate pentru a modifica frecvențele unui
semnal audio. Acestea sunt folosite pentru a elimina zgomotele, a modela
tonul și a crea efecte speciale.

#### Rezultatele funcțiilor din `studio.m`

##### Spectrograma pentru "Plain Loop"

Am utilizat funcția 'spectrogram' pentru a genera o spectrogramă a semnalului
din fișierul 'loop.wav'. Spectrograma arată prezența frecvențelor variate ale
semnalului audio pe întreaga durată a înregistrării. Se observă clar structura
frecvențială a semnalului muzical, indicând un amestec de frecvențe.

##### Spectrograma pentru "Plain Sound"

Pentru semnalul generat din fișierul 'music1.csv', spectrograma arată o
distribuție diferită a frecvențelor comparativ cu "Plain Loop".
Diferențele dintre spectrograma "Plain Sound" și "Plain Loop" se datorează
variabilității frecvențelor și amplitudinilor din cele două semnale.
"Plain Loop" conține repetarea unui set fix de frecvențe, în timp ce "Plain
Sound" are o structură mai complexă și variabilă.

##### Spectrograma pentru "Low Pass Sound"

După aplicarea unui filtru 'low_pass' la semnalul generat, spectrograma arată
o reducere semnificativă a componentelor frecvențiale mai înalte. Aceasta
modificare confirmă că filtrul 'low_pass' a eliminat frecvențele de peste 1000
Hz, păstrând doar frecvențele joase. Acest lucru este așteptat, deoarece
filtrul 'low_pass' permite trecerea doar a frecvențelor sub 1000 Hz.

##### Spectrograma pentru "Reverb Sound"

Aplicarea efectului de reverberație ('apply_reverb') asupra semnalului generat
produce o spectrogramă care arată prezența frecvențelor extinse în timp.
Efectul de reverberație adaugă o persistență a sunetului, vizibilă ca o
întindere a componentelor frecvențiale. Spectrograma "Reverb Sound" prezintă o
extindere temporală a componentelor frecvențiale, ceea ce indică adăugarea unei
reverberații. Comparativ cu "Plain Sound", se observă că frecvențele sunt mai
întinse pe axa timpului, reflectând ecourile adăugate de reverberație.

##### Spectrograma pentru "Tech"

Pentru semnalul din 'tech.wav', spectrograma arată o distribuție complexă a
frecvențelor, specifică unui semnal tehnologic sau electronic. Se observă
multiple componente frecvențiale variate pe întreaga durată a înregistrării.
Spectrograma "Tech" arată o prezență diversificată a frecvențelor, tipică
pentru muzica electronică. Multiple componente frecvențiale sunt vizibile,
reflectând complexitatea semnalului.

##### Spectrograma pentru "Low Pass Tech"

Filtrarea semnalului 'tech.wav' cu un filtru 'low_pass' arată, similar cu
exemplul anterior, o reducere a frecvențelor înalte, păstrând doar frecvențele
joase. Spectrograma este mai curată și arată mai puține componente
frecvențiale. Spectrograma "Low Pass Tech" arată clar reducerea frecvențelor
înalte, păstrând doar frecvențele joase. Aceasta confirmă eficiența filtrului
'low_pass' în eliminarea componentelor de frecvență înaltă.

##### Spectrograma pentru "Reverb Tech"

Spectrograma "Reverb Tech" arată extinderea temporală a componentelor
frecvențiale datorită reverberației. Aceasta este vizibilă ca o întindere a
frecvențelor pe axa timpului, reflectând ecourile adăugate.

##### Spectrograma pentru "Low Pass + Reverb Tech"

Spectrograma "Low Pass + Reverb Tech" arată cum frecvențele joase sunt extinse
temporal după aplicarea reverberației. Filtrarea inițială elimină frecvențele
înalte, iar reverberația adaugă persistență frecvențelor rămase.

##### Spectrograma pentru "Reverb + Low Pass Tech"

Aplicarea inițială a reverberației și apoi a filtrului 'low_pass' produce o
spectrogramă similară, dar cu unele diferențe subtile. Frecvențele joase sunt
mai pronunțate și clar delimitate datorită filtrului aplicat după reverberație.

#### Concluzii

Analizând spectrogramele obținute, se pot concluziona următoarele:
- Filtrul `low_pass` este eficient în eliminarea frecvențelor înalte,
  păstrând doar frecvențele joase.
- Efectul de reverberație adaugă o persistență a sunetului, vizibilă în
  spectrogramă prin extinderea frecvențelor în timp.
- Ordinea aplicării efectelor (low-pass și reverb) poate influența rezultatul
  final în moduri subtile, observabile în spectrogramă.

### TASK 2

#### INTERPOLAREA SPLINE CUBICĂ

Funcția `spine_c2` realizează interpolarea spline cubică naturală prin
rezolvarea unui sistem de ecuații liniare. Etapele algoritmului sunt:

- Construcția matricei de coeficienți și vectorului de termeni liberi:
  Matrice de 4*n x 4*n și vectorul de soluții de 4*n x 1
  - Acestea sunt folosite pentru a defini și rezolva sistemul de ecuații
    liniare

##### Pasul 1: Interpolarea condițiilor inițiale s_i(xi) = yi, i = 0 : n - 1
și a condițiilor de frontieră naturală s_n-1(xn) = yn:
- Condițiile inițiale asigură construirea primei porțiuni din matrice și
  din vector
- Apoi, se asigură condiția de frontieră naturală prin adăugarea
  corespunzătoare în matrice și în vector

##### Pasul 2: Construirea matricei pentru ecuațiile spline:
- Completez matricea pentru a asigura interpolarea spline cubică între
  fiecare pereche de puncte adiacente
- Calculez coeficienții a, b, c, d pentru fiecare interval și îi adaug
  în matrice

##### Pasul 3: Condiții de frontieră naturală:
- Adaug ecuațiile:
  - s0''(x0) = 0
  - s_n-1''(x_n) = 0 pentru a asigura că a doua derivată a spline-ului este
    zero la capetele intervalului de interpolare, ceea ce controlează curba
    spline-ului.
- Aceste ecuații asigură astfel un comportament neted și continuu în
  întregile intervale de interpolare.

##### Rezolvarea sistemului de ecuații liniare:
- Cu toate că determinarea matricei și a vectorului este pur matematică,
  aleg să rezolv sistemul de ecuații cu ajutorul descompunerii LU
- LU are o performanță îmbunătățită față de metoda calculului inversei
  unei matrice, algoritm ce trebuie evitat în mediul computațional
- Folosesc matricea de permutare P în desc lu: [L, U, P] = lu(A);
  pentru a obține o soluție numerică mai precisă și mai stabilă a
  sistemului de ecuații liniare.

Funcția `P_spline` primește coeficienții spline-ului cubic (coef),
vectorul de noduri (x) și vectorul de puncte pentru care se dorește
interpolarea (x_interp). Etapele algoritmului sunt:

##### Pasul 1: Calculez numărul de subintervale n bazat pe lungimea vectorului
de noduri x.
- Creez un vector gol y_interp pentru a stoca rezultatele interpolării

##### Pasul 1: Interpolare spline cubică:
- Se parcurge fiecare punct din vectorul x_interp pentru a determina
  valoarea interpolată corespunzătoare.

##### Pasul 3: Găsirea intervalului:
- Pentru fiecare punct de interpolare, găsesc intervalul corespunzător
  din vectorul x, în care acesta se află
- Acest lucru se realizează folosind funcția find pentru a determina primul
  index al intervalului care conține punctul

##### Pasul 4: Extragerea coeficienților:
- După ce determin intervalul corespunzător, coeficienții spline-ului
  cubic pentru acel interval sunt extrași din vectorul coef

##### Pasul 5: Calculul interpolării:
- Calculez valoarea interpolată pentru punctul respectiv, folosind formula
  spline-ului cubic și coeficienții corespunzători
- Valoarea interpolată este stocată în vectorul y_interp pe poziția
  corespunzătoare

#### COEFICIENTII VANDERMONDE

Funcția `vandermonde(x, y)` creează matricea Vandermonde V, în care fiecare
coloană conține puterile corespunzătoare vectorului x.
- Coeficienții polinomului de interpolare sunt calculați folosind această
  matrice și vectorul y al valorilor corespunzătoare.
- Funcția returnează vectorul coef care conține coeficienții polinomului

Funcția `P_vandermonde(coef, x_interp)` iterează prin fiecare punct de
interpolare din x_interp și calculează valoarea interpolată pentru
fiecare polinom, utilizând coeficienții "coef".

### TASK 3

#### Preprocesare

Preprocesarea este procesul prin care se reduce volumul mare de date,
micșorând dimensiunea matricei cu care se lucrează. Funcția `preprocess.m`
primește o matrice 'A' și un număr întreg 'min_count'. Are ca scop
eliminarea tuturor clienților (liniilor) care au oferit strict mai puține
recenzii decât 'min_count'.

#### Similaritatea cosinus

Similaritatea cosinus este o măsură de similaritate între doi vectori nenuli,
definită ca fiind cosinusul unghiului dintre cei doi vectori.
Funcția `cosine_similarity.m` primește doi vectori coloană, îi normalizează
și calculează similaritatea cosinus conform formulei din cerință.

Funcția `read_mat.m` citește cu ajutorul funcției 'csvread(path)' matricea
dintr-un fișier *.csv și o construiește eliminând headerele.

#### Recomandari

Funcția `recommendations.m` este concepută pentru a genera recomandări de teme
care sunt similare cu o temă pe care un utilizator a apreciat-o. Aceasta face
parte dintr-un sistem de recomandare care utilizează analiza matricială pentru
a determina similaritatea între diferite teme și pentru a sugera teme relevante
bazate pe preferințele utilizatorului. Aceasta funcție utilizează descompunerea
SVD [U, S, V] = svds(reduced_mat, num_features); pentru a reduce complexitatea
datelor și pentru a identifica caracteristicile relevante ale temelor.
