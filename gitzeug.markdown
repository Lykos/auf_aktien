Verwendung von Git
==================

Git ist ein verteiltes Versionsverwaltungssystem, dass es einem einzelnen Programmierer ermöglicht,
effizient Änderungen und versehentliches löschen Rückgängig zu machen und mehreren Programmierern
erlaubt, zusammenzuarbeiten an einem Programm.

Zeug herunterladen
-------------------
Neue Sachen aus Github runterladen: `git pull origin master'

Arbeiten (Befehle)
------------------
- Neuer Branch: `git checkout -b branch_name'
- Bestehende Branches anschauen: `git branch'
- Zu einem Branch wechseln: `git checkout branch_name'
- Einen eingebauten branch löschen: `git branch -d branch_name'
- Einen Branch zum jetzigen Branch dazutun: `git merge branch_name'
- Zum Hauptbranch gehen: `git checkout master'
- Datei hinzufügen: `git add dateiname'
- Schauen welche Sachen du verändert hast: `git status'
- Ohne Rücksicht auf verluste löschen: `git branch -D'
- Änderungen committen (Möglichst oft machen: `git branch -a -m änderungs_nachricht'
- Änderungen in einer Datei seit dem letzten commit rückgängig machen: `git checkout HEAD datei_name'
- Alle Änderungen seit dem letzten commit rückgängig machen: `git reset --hard HEAD'
- Einen ganzen commit Rückgängig machen: `git revert HEAD'

Hochladen
---------
- Unbedingt die bisherigen Änderungen neu herunterladen: `git pull origin master'
- Verfügbar machen: `git push origin master'

Arbeiten (Typischer Ablauf)
---------------------------
- Für eine neue Sache einen neuen Branch aufmachen.
- Dateien ändern und neue hinzufügen.
- Immer wieder committen.
- Eventuell Änderungen rückgängig machen.
- Wenn die Änderungen Scheisse sind:
  - Wieder zum Hauptbranch gehen.
  - Doofen Branch löschen.
- Wenn die Änderungen gut sind:
  - Zum Hauptbranch gehen.
  - Den Änderungsbranch reinmergen.
  - hochladen

