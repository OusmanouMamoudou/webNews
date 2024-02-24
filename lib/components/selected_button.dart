import 'package:flutter/material.dart';
import 'package:web_news/const.dart';

// Ce widget SelectedButton représente un bouton utilisé pour sélectionner
//des catégories. Il peut être sélectionné ou non, et s'il est vide,
//un SnackBar s'affiche pour informer l'utilisateur qu'il a dépassé son quota YouTube.

class SelectedButton extends StatelessWidget {
  const SelectedButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onPressed,
    this.isEmpty,
  }) : super(key: key);

  final String text; // Texte affiché sur le bouton
  final bool isSelected; // Indique si le bouton est sélectionné ou non
  final void Function()?
      onPressed; // Fonction appelée lorsque le bouton est pressé
  final bool?
      isEmpty; // Indique si le bouton est vide ou non (dépasser le quota YouTube)

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Taille de l'écran
    double height = size.height; // Hauteur de l'écran

    return TextButton(
      onPressed: isEmpty == true // Vérifie si le bouton est vide
          ? () {
              // Affiche un SnackBar si le bouton est vide
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Vous avez dépassé votre Quota YouTube",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  backgroundColor: kBackgroundColor,
                ),
              );
            }
          : onPressed, // Appelle la fonction onPressed si le bouton n'est pas vide
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text, // Affiche le texte du bouton
            style: TextStyle(
              fontSize: height * 0.015, // Taille du texte
              color: isEmpty == true
                  ? Colors
                      .grey // Couleur du texte en gris si le bouton est vide
                  : isSelected
                      ? kAppBarColor // Couleur du texte en vert si le bouton est sélectionné
                      : Colors.black, // Couleur du texte en noir par défaut
            ),
          ),
          if (isSelected) // Affiche un cercle coloré si le bouton est sélectionné
            Material(
              color: kAppBarColor, // Couleur du cercle
              elevation: 10, // Élévation du cercle
              borderRadius: const BorderRadius.all(
                  Radius.circular(100)), // Bordures circulaires
              child: Padding(
                padding: EdgeInsets.all(
                    height * 0.008), // Marge intérieure du cercle
              ),
            )
        ],
      ),
    );
  }
}
