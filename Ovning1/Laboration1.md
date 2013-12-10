#Frågor och Uppgifter#

1.  Vad kommer att listas ut vid följande kommando?
    *   la-la [a]*[!e] - Filer och mappar som innehåller tecknet 'a', vilka tecken som helst och inte slutar på 'e'.
    *   ls -la *[f-i]? - Filer och mappar som börjar på vilket tecken som helst och innehåller tecken mellan 'f' och 'i' och slutar på vilket tecken som helst.
    *   ls -la ????.[co] - Filer och mappar med exakt fyra valfria tecken, separeras med punkt och slutar på 'c' eller 'o'.

2.  Om du vill lista alla filer som börjar på 'a' och slutar på .'c', vilket wildcard använder du då?
    *   ls -la [a]*[\.c]

3.  Om du skriver ls -la >> /test/test, vad händer då?
    *   Printar ut resultatet från ls i filen 'test'.

4.  Lista alla filer i hela filsystemet till en fil som heter ls-laR.gz, den ska alltså också vara komprimerad, eventuella felmeddelanden ska hamn i ls-laR-errors.txt
    *   ls -a / >> ls-laR.gz 2> ls-laR-errors.txt

5.  Vad är miljövariabeln PATH för något? Hur lägger du till katalogen ~/bin till PATH? Hur gör du så att denna ändring sker vid varje inloggning?
    *   export PATH=$PATH:~/bin, lägg in i .bashrc

6.  Vad händer om du skriver top i .bash_logout?
    *   Top startas när logout körs i skalet

7.  Hur använder mekanismen pushd,popd och dirs?
    *   pushd lägger kataloger i minnet, popd tar fram dem i ordningen de är sparade och dirs visar vilka kataloger som ligger i minnet.

8.  Vad är ett "null command" och varför finns det?
    *  Ett kolon. Returnerar ett 'sant' värde. 
