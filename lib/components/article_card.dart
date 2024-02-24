import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:web_news/const.dart';
import 'package:web_news/screens/article_info.dart';
import 'package:web_news/services/datas.dart';

// Ce widget ArticleCard représente une carte d'article qui affiche les détails de l'article comme l'auteur,
// la source, le titre et la date. Il permet également de partager
//l'article en maintenant le clic ou en naviguant vers
//une page d'informations détaillées sur l'article en appuyant dessus.

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.index}) : super(key: key);

  final int index; // Index de l'article dans la liste

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Taille de l'écran
    double height = size.height; // Hauteur de l'écran
    double width = size.width; // Largeur de l'écran

    return Consumer<Datas>(builder: (context, datas, child) {
      final articles = datas.articles; // Liste des articles
      final author = articles[index].author; // Auteur de l'article
      final sourceName =
          articles[index].sourceName; // Nom de la source de l'article
      final title = articles[index].title; // Titre de l'article
      final url = articles[index].url; // URL de l'article
      final urlImage = articles[index].urlImage; // URL de l'image de l'article
      final date = articles[index].date; // Date de publication de l'article
      final desc = articles[index].desc; // Description de l'article

      return Material(
        color: kAppBarColor, // Couleur de fond du matériau
        child: GestureDetector(
          onLongPress: () async {
            Share.share(url!); // Partager l'URL de l'article
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleInfo(
                          // Naviguer vers l'écran d'informations sur l'article
                          author: author,
                          title: title,
                          url: url,
                          urlImage: urlImage,
                          desc: desc,
                          date: date,
                          sourceName: sourceName,
                        )));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (urlImage != null)
                      SizedBox(
                        height: height * 0.09,
                        width: width * 0.4,
                        child: Image.network(
                          urlImage,
                          alignment: Alignment.topLeft,
                          fit: BoxFit.cover,
                        ),
                      ),
                    SizedBox(width: width * 0.05),
                    SizedBox(
                      width: width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Author: ${author.toString()}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: height * 0.015,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Source: ${sourceName.toString()}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: height * 0.015,
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Date: ${date.toString().substring(0, 10)}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: height * 0.015,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Flexible(
                  child: Text(
                    title.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Créer une ligne
                const Divider(
                  color: kBackgroundColor,
                  endIndent: 20,
                  indent: 20,
                  thickness: 3,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
