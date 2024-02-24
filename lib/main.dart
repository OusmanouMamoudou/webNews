// Ce code configure votre application Flutter,
// utilise Provider pour gérer l'état avec ChangeNotifier,
// définit le thème de l'application et affiche l'écran d'accueil.
//Les commentaires expliquent chaque partie du code pour une meilleure compréhension.

import 'package:flutter/material.dart';
import 'package:web_news/const.dart'; // Importation des constantes
import 'package:web_news/screens/home.dart'; // Importation de l'écran d'accueil
import 'package:web_news/services/datas.dart'; // Importation des services de données
import 'package:provider/provider.dart'; // Importation de Provider pour la gestion de l'état

void main() {
  runApp(const MyApp()); // Lancement de l'application Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; // Récupération de la taille de l'écran
    double height = size.height; // Hauteur de l'écran

    return ChangeNotifierProvider<Datas>(
      // Utilisation de ChangeNotifierProvider pour fournir l'état de Datas
      create: (context) => Datas(), // Création d'une instance de Datas
      builder: (context, child) => MaterialApp(
        // Définition de l'application MaterialApp
        debugShowCheckedModeBanner:
            false, // Désactivation de la bannière de débogage
        title: 'WebNews', // Titre de l'application
        theme: ThemeData(
          // Thème de l'application
          colorScheme: ColorScheme.fromSeed(
              seedColor:
                  kBackgroundColor), // Schéma de couleurs basé sur la couleur d'arrière-plan
          textTheme: const TextTheme(
            // Thèmes de texte
            bodyLarge: TextStyle(
                color:
                    kTextColor), // Style de texte pour les corps de grande taille
            bodyMedium: TextStyle(
                color:
                    kTextColor), // Style de texte pour les corps de taille moyenne
            bodySmall: TextStyle(
                color: kTextColor), // Style de texte pour les petits corps
          ),
          appBarTheme: AppBarTheme(
              // Thème de la barre d'applications
              backgroundColor:
                  kAppBarColor, // Couleur de fond de la barre d'applications
              elevation: 10, // Élévation de la barre d'applications
              titleTextStyle: TextStyle(
                // Style du texte du titre de la barre d'applications
                fontWeight: FontWeight.bold, // Poids de la police en gras
                fontSize: height *
                    0.04, // Taille de la police basée sur la hauteur de l'écran
              )),
          scaffoldBackgroundColor:
              kBackgroundColor, // Couleur de fond de l'interface
          useMaterial3: true, // Activation de Material 3
        ),
        home: Consumer<Datas>(builder: (context, datas, child) {
          // Utilisation de Consumer pour écouter les changements dans Datas
          datas
              .fetchArticles(); // Appel de la méthode pour récupérer les articles
          datas
              .fetchTutorials(); // Appel de la méthode pour récupérer les tutoriels
          return const Home(); // Affichage de l'écran d'accueil
        }),
      ),
    );
  }
}
