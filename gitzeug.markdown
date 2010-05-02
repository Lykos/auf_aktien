Verwendung von Git
==================

Git ist ein verteiltes Versionsverwaltungssystem, dass es einem einzelnen Programmierer erm�glicht,
effizient �nderungen und versehentliches l�schen R�ckg�ngig zu machen und mehreren Programmierern
erlaubt, zusammenzuarbeiten an einem Programm.

Zeug herunterladen
-------------------
Neue Sachen aus Github runterladen: `git pull origin master`

Arbeiten (Befehle)
------------------
- Neuer Branch: `git checkout -b branch_name`
- Bestehende Branches anschauen: `git branch`
- Zu einem Branch wechseln: `git checkout branch_name`
- Einen eingebauten branch l�schen: `git branch -d branch_name`
- Einen Branch zum jetzigen Branch dazutun: `git merge branch_name`
- Zum Hauptbranch gehen: `git checkout master`
- Datei hinzuf�gen: `git add dateiname`
- Schauen welche Sachen du ver�ndert hast: `git status`
- Ohne R�cksicht auf verluste l�schen: `git branch -D`
- �nderungen committen (M�glichst oft machen: `git branch -a -m �nderungs_nachricht`
- �nderungen in einer Datei seit dem letzten commit r�ckg�ngig machen: `git checkout HEAD datei_name`
- Alle �nderungen seit dem letzten commit r�ckg�ngig machen: `git reset --hard HEAD`
- Einen ganzen commit R�ckg�ngig machen: `git revert HEAD`

Hochladen
---------
- Unbedingt die bisherigen �nderungen neu herunterladen: `git pull origin master`
- Verf�gbar machen: `git push origin master`

Arbeiten (Typischer Ablauf)
---------------------------
- F�r eine neue Sache einen neuen Branch aufmachen.
- Dateien �ndern und neue hinzuf�gen.
- Immer wieder committen.
- Eventuell �nderungen r�ckg�ngig machen.
- Wenn die �nderungen Scheisse sind:
  - Wieder zum Hauptbranch gehen.
  - Doofen Branch l�schen.
- Wenn die �nderungen gut sind:
  - Zum Hauptbranch gehen.
  - Den �nderungsbranch reinmergen.
  - hochladen

