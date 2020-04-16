# covid19monitoring_mobility_VerkehrsmessstellenKantonZH

## Grundlage
Tageswerte zum Verkehrsaufkommen (Anzahl Fahrzeuge) an ausgewählten Verkehrsmessstellen im Kanton Zürich (ausgenommen Stadt Zürich und Winterthur). Erhoben und bereitgestellt werden die Daten von Kanton Zürich, Baudirektion, Tiefbauamt.

## Methodisches
Das Datenfile `Mobility_VerkehrsmessstellenKantonZH.csv` wird in der Regel täglich aktualisiert.

Messstellen MIV (`variable_long`):
- Kilchberg (ZH0109), Seestrasse
- Knonau (ZH1109), Zürichstrasse
- Zollikon (ZH1288), Forchstrasse
- Langnau am Albis (ZH1887), Albisstrasse
- Obfelden (ZH0208), Dorfstrasse
- Horgen (ZH2287), Zugerstrasse
- Thalwil (ZH3690), Zürcherstrasse
- Horgen (ZH4790), Zugerstrasse
- Dübendorf (ZH5191), Zürichstrasse
- Uster (ZH0587), Riedikerstrasse
- Zürich (ZH0609), Birmensdorferstrasse
- Winkel (ZH0110), Autobahn (A51)
- Uster (ZH5186), Oberland-Autobahn (A53) - 9.4.-14.4.2020 keine Daten
- Regensdorf (ZH2085), Wehntalerstrasse - 1.1. -12.2.2020 keine Daten
- Birmensdorf (ZH3687), Aargauerstrasse

Messtellen Velo vermerkt in `variable_long`:
- Dietikon (ZH1018)
- Hausen am Albis (ZH2019)
- Greifensee (ZH0316)
- Regensdorf (ZH0716)

Die Geokoordinaten der Verkehrsmessstellen stehen auf dem [GIS-Browser](https://maps.zh.ch?topic=TBAVMSZH&scale=294568&x=2692500&y=1252500&srid=2056&offlayers=bezirkslabels) zur Verfügung. 

## Weitere Hinweise zur Variable
Erfasst werden fünf MIV-Fahrzeugkategorien (gemäss SWISS10) sowie Velo (`variable_short`):
- Privatverkehr (PW, PW mit Anhänger)
- Geschäftsverkehr (Lieferwagen, Lieferwagen mit Anhänger und Lieferwagen mit Aufleger, Bus/Car, Lastwagen, Lastenzug und Sattelzug)
- Motorrad
- Velo
- Total (Summe Fahrzeuge pro Tag und MIV-Fahrzeugkategorie, exkl. Velo)

Die Tageswerte je Fahrzeugkategorie (MIV) sind kumuliert für alle Fahrtrichtungen.

Hinweise zu technischen Unterbrüchen, Feier- und Ferientagen sowie weiteren Behinderungen finden sich im File `Mobility_VerkehrsmessstellenKantonZH_Datenvollständigkeit.xlsx`.

