import 'package:flutter/material.dart';
import 'package:web_news/const.dart'; // Importation des constantes

// Ce widget AppBarTitle affiche le titre de l'application ainsi que son logo
//dans une ligne horizontale. Le titre est récupéré à partir des constantes
//définies dans le fichier const.dart. Le logo est affiché à partir d'une image locale.
// La hauteur de l'image est ajustée en fonction de la hauteur spécifiée lors de
//la construction du widget.

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key, // Clé optionnelle pour l'identification du widget
    required this.height, // Hauteur requise pour l'ajustement de la taille de l'image
  }) : super(
            key:
                key); // Appel au constructeur de la classe mère StatelessWidget

  final double height; // Hauteur de l'image du logo

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.start, // Alignement des enfants à gauche
      children: [
        const Text(kTitle), // Affichage du titre de l'application
        Image.asset("images/logo.png",
            height:
                height * 0.05), // Affichage du logo avec une hauteur ajustée
      ],
    );
  }
}
