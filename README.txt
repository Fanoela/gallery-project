PROJET GALLERIE D'ART
Fanoela Rabemanotrona
INT

-----------------------------

Veuillez ouvrir ce lien pour visualiser le rendu global:
https://fanoela.github.io/gallery-project/index.html

Pour tester le login (avec le backend et la base de donnees), le serveur doit être lancé depuis le dossier 'backend', car uvicorn recherche main.py dans ce répertoire:
cd backend
uvicorn main:app --reload

Un fichier env-example se situe dans le dossier backend, c'est un placeholder du fichier .env
La base de donnees dump.sql se situe egalement dans le dossier backend.

------------------------------

Stacks:
Frontend:
HTML
CSS
Vanilla Javascript

Database:
MySQL

Backend:
FastAPI
----------------------------

Features:
cart (panier)
authentication (signup/login/logout)
stock management (static avec json)
--------------------------------

In progress (en cours):
delivery (livraison)
payment API
chatbot
