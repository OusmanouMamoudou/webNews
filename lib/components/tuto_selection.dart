import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importation du package provider pour la gestion de l'état
import 'package:web_news/components/selected_button.dart'; // Importation du composant SelectedButton
import 'package:web_news/services/datas.dart'; // Importation de la classe Datas pour récupérer les données

class TutoSelection extends StatelessWidget {
  const TutoSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Datas>(
      builder: (context, datas, child) => Card(
        // Carte contenant les boutons de sélection
        child: Row(
          // Ligne contenant les boutons
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Espacement égal entre les boutons
          children: [
            SelectedButton(
              // Bouton pour les vidéos les plus vues
              onPressed: () {
                datas
                    .forMostViewed(); // Appel de la méthode pour afficher les vidéos les plus vues
              },
              text: "Most Viewed", // Texte du bouton
              isSelected:
                  datas.isMostViewed, // Vérifie si le bouton est sélectionné
            ),
            SelectedButton(
              // Bouton pour les vidéos les plus récentes
              onPressed: () {
                datas
                    .forMostRecent(); // Appel la méthode pour afficher les vidéos les plus récentes
              },
              text: "Most Recent", // Texte du bouton
              isSelected:
                  datas.isMostRecent, // Vérifie si le bouton est sélectionné
              isEmpty: datas.tutorials
                  .isEmpty, // Vérifie si la liste de tutoriels est vide
            ),
          ],
        ),
      ),
    );
  }
}
