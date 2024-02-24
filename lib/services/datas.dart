import 'package:flutter/material.dart';
import 'package:web_news/const.dart'; // Importation des constantes
import 'package:web_news/models/article.dart'; // Importation du modèle d'article
import 'package:web_news/models/youtube.dart'; // Importation du modèle YouTube
import 'package:web_news/services/network_helper.dart'; // Importation de l'aide réseau

class Datas extends ChangeNotifier {
  // Sélection des booléens pour filtrer les articles
  bool isMostViewed = true,
      isMostRecent = false,
      isWebDev = true,
      isJavaS = false,
      isReact = false,
      isNodeJs = false,
      isDjango = false,
      isPython = false;

  // Fonctions pour filtrer les articles par différentes catégories
  void forMostViewed() {
    isMostViewed = true;
    isMostRecent = false;
    fetchTutorials(); // Appel à la fonction pour récupérer les vidéos YouTube
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles les plus récents
  void forMostRecent() {
    isMostViewed = false;
    isMostRecent = true;
    fetchTutorials(); // Appel à la fonction pour récupérer les vidéos YouTube
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur le développement web
  void forWebdev() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = true;
    isJavaS = false;
    isPython = false;
    isReact = false;
    isNodeJs = false;
    isDjango = false;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur JavaScript
  void forJavaS() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = false;
    isJavaS = true;
    isPython = false;
    isReact = false;
    isNodeJs = false;
    isDjango = false;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur Python
  void forPyton() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = false;
    isJavaS = false;
    isPython = true;
    isReact = false;
    isNodeJs = false;
    isDjango = false;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur React
  void forReact() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = false;
    isJavaS = false;
    isPython = false;
    isReact = true;
    isNodeJs = false;
    isDjango = false;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur Node.js
  void forNodeJs() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = false;
    isJavaS = false;
    isPython = false;
    isReact = false;
    isNodeJs = true;
    isDjango = false;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour filtrer les articles sur Django
  void forDjango() {
    // Sélection du filtre et appel à la fonction pour récupérer les articles
    isWebDev = false;
    isJavaS = false;
    isPython = false;
    isReact = false;
    isNodeJs = false;
    isDjango = true;
    fetchArticles();
    notifyListeners(); // Notifier les auditeurs du changement
  }

  // Fonction pour récupérer les articles depuis l'API de News
  List<Article> articles = [];
  Future<void> fetchArticles() async {
    // Définition de la requête en fonction du filtre sélectionné
    String articleQuery = "web%20development";
    if (isJavaS) {
      articleQuery = "web%20javascript";
    } else if (isPython) {
      articleQuery = "web%20python";
    } else if (isReact) {
      articleQuery = "web%20react";
    } else if (isNodeJs) {
      articleQuery = "web%20Node%20js";
    } else if (isDjango) {
      articleQuery = "web%20django";
    } else {
      articleQuery = "web%20development";
    }

    // Récupération des données depuis l'API de News
    final data = await NetworkHelper(
            'https://newsapi.org/v2/everything?q=$articleQuery&apiKey=$newsApiKey')
        .getData();

    // Traitement des données récupérées
    if (data['status'] == 'ok') {
      articles.clear(); // Nettoyage de la liste d'articles
      for (var item in data['articles']) {
        articles.add(Article.fromJson(item)); // Ajout des articles à la liste
        notifyListeners(); // Notifier les auditeurs du changement
      }
      notifyListeners(); // Notifier les auditeurs du changement
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Fonction pour récupérer les vidéos YouTube depuis l'API YouTube
  List<Youtube> tutorials = [];
  Future<void> fetchTutorials() async {
    int maxPages = 20; // Nombre maximal de pages à récupérer
    String? nextPageToken; // Jeton de page suivante

    String order = "viewCount"; // Ordre par défaut

    if (isMostViewed) {
      order = "viewCount"; // Si les vidéos les plus vues sont sélectionnées
    } else {
      order = "date"; // Sinon, les vidéos les plus récentes
    }

    // Boucle pour récupérer les vidéos à partir de plusieurs pages
    for (int page = 0; page < maxPages; page++) {
      final data = await NetworkHelper(
        // Requête pour récupérer les vidéos
        'https://youtube.googleapis.com/youtube/v3/search?part=snippet&order=$order&q=web%20development&key=$youtubeApiKey'
        '${nextPageToken != null ? '&pageToken=$nextPageToken' : ''}',
      ).getData();

      // Traitement des données récupérées
      if (data != null && data.containsKey('items')) {
        tutorials.clear(); // Nettoyage de la liste de vidéos
        final List<dynamic> items = data['items'];

        // Parcours des éléments récupérés
        for (var item in items) {
          final snippet = item['snippet'];
          final id = item['id'];

          final youtube = Youtube(
            title: snippet['title'],
            publishedAt: snippet['publishedAt'],
            desc: snippet['description'],
            channelName: snippet['channelTitle'],
            videoId: id['videoId'],
          );

          tutorials.add(youtube); // Ajout de la vidéo à la liste
        }

        notifyListeners(); // Notifier les auditeurs du changement
      }

      // Vérification de la présence d'une page suivante
      if (data != null && data.containsKey('nextPageToken')) {
        nextPageToken = data['nextPageToken'];
      } else {
        break; // Pas de page suivante disponible, sortir de la boucle
      }
    }
  }

  // Liste de vidéos YouTube préchargées (à des fins de démonstration)
  List<Youtube> tutorialsViews = [
    Youtube(
        title: "If life were like web design — Webflow",
        videoId: "Ojiv9Smi4XE",
        desc: "If life were like web design, you'd never put up with it. "
            "That's why we made Webflow, the modern way to build for the web."
            " Sign up ...",
        publishedAt: "2021-01-14",
        channelName: "Webflow"),
    // Ajouter d'autres vidéos préchargées ici...
  ];
}
