// Ces constantes sont utilisées dans votre application Flutter pour définir
//des valeurs réutilisables telles que les couleurs, les styles de texte,
//les décorations de champ de texte et les clés API. Les commentaires expliquent
//le but de chaque constante pour une meilleure compréhension.

import 'package:flutter/material.dart';

// Titre de l'application
const kTitle = "WebNews";

// Couleur de la barre d'applications
const kAppBarColor = Color(0xff38947D);
// Couleur de fond de l'interface
const kBackgroundColor = Color(0xff2F313D);
// Couleur du texte
const kTextColor = Color(0xff51F5D0);

// Décoration de l'entrée de texte
const kInputDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search, color: kTextColor), // Icône de recherche
  hintText: "Entrer une Info...", // Texte d'invite
  hintStyle: TextStyle(
    color: kTextColor, // Couleur du texte d'invite
  ),
  enabledBorder: OutlineInputBorder(
    // Bordure lorsque le champ est activé
    borderSide: BorderSide(
      color: kAppBarColor, // Couleur de la bordure
      width: 1.5, // Largeur de la bordure
    ),
  ),
  focusedBorder: OutlineInputBorder(
    // Bordure lorsque le champ est sélectionné
    borderSide: BorderSide(
      color: kAppBarColor, // Couleur de la bordure
      width: 2.5, // Largeur de la bordure
    ),
  ),
);

// Clé API pour les articles
const newsApiKey = "";
// Clé API pour YouTube
const youtubeApiKey = "";
