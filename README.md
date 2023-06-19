# Laboratorium i projekt z przedmiotu Sygnały radiolokacyjne i metody ich przetwarzania

Jan Jędrzejewski 2023L

## Laboratorium

Cztery spotkania laboratoryjne realizowane w Matlabie, podzielono na podfoldery
- lab1 - Kompresja impulsu
- lab2 - Filtracja dopplerowska (MTI/MTD)
- lab3 - Detekcja obiektów (CFAR)
- lab4 - Śledzenie obiektów (Filtr Kalmana)

## Projekt - Wstępne przetwarzanie danych radarowych

Projekt jest wstępem do pracy inżynierskiej pod tytułem "Wykorzystanie metod sztucznej inteligencji do klasyfikacji obiektów radarowych".  Surowe dane z radaru FMCW należy przetworzyć na obazy range-doppler (obraz częstoliwości dopplerowskiej obiektu w odległości), a następnie podać na wejście algorytmu klasyfikacji obiektów.

W ramach projektu powstała implementacja metody w Matlabie która tworzy obraz range-speed (odległości i prędkości obiektu). Wzorowana na metodzie z toolbaxa Phased Array - RangeDopplerResponse. Zaimplementowana metoda daje obrazy porównywalne do metoty z biblioteki.