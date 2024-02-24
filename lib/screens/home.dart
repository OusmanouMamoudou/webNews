import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_news/components/appbar_title.dart'; // Import du composant AppBarTitle
import 'package:web_news/components/article_card.dart'; // Import du composant ArticleCard
import 'package:web_news/components/article_selection.dart'; // Import du composant ArticleSelection
import 'package:web_news/components/tuto_card.dart'; // Import du composant TutoCard
import 'package:web_news/components/tuto_selection.dart'; // Import du composant TutoSelection
import 'package:web_news/services/datas.dart'; // Import du service Datas

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return Consumer<Datas>(builder: (context, datas, child) {
      return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
              height:
                  height), // Utilisation du composant AppBarTitle pour afficher le titre de l'application
        ),
        body: Column(
          children: [
            const TutoSelection(), // Affichage de la sélection de tutoriels
            SizedBox(
              height: height * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datas.tutorials.isNotEmpty
                    ? datas.tutorials.length
                    : datas.tutorialsViews.length,
                itemBuilder: (context, i) {
                  final isNotEmpty = datas.tutorials.isNotEmpty;

                  final videoId = isNotEmpty
                      ? datas.tutorials[i].videoId
                      : datas.tutorialsViews[i].videoId;

                  return TutoCard(
                    videoId: videoId!,
                    index: i,
                  );
                },
              ),
            ),
            const ArticleSelection(), // Affichage de la sélection d'articles
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: datas.articles.length,
                itemBuilder: (context, i) {
                  return ArticleCard(index: i);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
