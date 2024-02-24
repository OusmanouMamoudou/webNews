import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_news/components/selected_button.dart'; // Importe le widget SelectedButton
import 'package:web_news/services/datas.dart'; // Importe la classe Datas qui contient les données

// Ce widget ArticleSelection affiche des boutons pour sélectionner différentes catégories d'articles.
//Il utilise le widget SelectedButton pour chaque bouton, et il met à jour l'état des sélections en appelant
//les méthodes appropriées de la classe Datas.

class ArticleSelection extends StatelessWidget {
  const ArticleSelection(
      {super.key}); // Constructeur de la classe ArticleSelection

  @override
  Widget build(BuildContext context) {
    return Consumer<Datas>(
      // Écouteur de changements sur la classe Datas
      builder: (context, datas, child) => Card(
        // Crée une carte pour afficher les boutons de sélection
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SelectedButton(
                // Bouton pour sélectionner la catégorie "Web Development"
                onPressed: () {
                  datas
                      .forWebdev(); // Appelle la méthode forWebdev de la classe Datas
                },
                text: "Web Development",
                isSelected:
                    datas.isWebDev, // Vérifie si la catégorie est sélectionnée
              ),
              SelectedButton(
                // Bouton pour sélectionner la catégorie "JavaScript"
                onPressed: () {
                  datas
                      .forJavaS(); // Appelle la méthode forJavaS de la classe Datas
                },
                text: "JavaScript",
                isSelected:
                    datas.isJavaS, // Vérifie si la catégorie est sélectionnée
              ),
              SelectedButton(
                // Bouton pour sélectionner la catégorie "Python"
                onPressed: () {
                  datas
                      .forPyton(); // Appelle la méthode forPyton de la classe Datas
                },
                text: "Python",
                isSelected:
                    datas.isPython, // Vérifie si la catégorie est sélectionnée
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SelectedButton(
                // Bouton pour sélectionner la catégorie "React"
                onPressed: () {
                  datas
                      .forReact(); // Appelle la méthode forReact de la classe Datas
                },
                text: "React",
                isSelected:
                    datas.isReact, // Vérifie si la catégorie est sélectionnée
              ),
              SelectedButton(
                // Bouton pour sélectionner la catégorie "NodeJS"
                onPressed: () {
                  datas
                      .forNodeJs(); // Appelle la méthode forNodeJs de la classe Datas
                },
                text: "NodeJS",
                isSelected:
                    datas.isNodeJs, // Vérifie si la catégorie est sélectionnée
              ),
              SelectedButton(
                // Bouton pour sélectionner la catégorie "Django"
                onPressed: () {
                  datas
                      .forDjango(); // Appelle la méthode forDjango de la classe Datas
                },
                text: "Django",
                isSelected:
                    datas.isDjango, // Vérifie si la catégorie est sélectionnée
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
