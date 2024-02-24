import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:web_news/components/appbar_title.dart'; // Import du composant AppBarTitle
import 'package:web_news/const.dart'; // Import des constantes

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({
    Key? key,
    this.author,
    this.title,
    this.sourceName,
    this.desc,
    this.url,
    this.urlImage,
    this.date,
  }) : super(key: key);

  final String? author;
  final String? sourceName;
  final String? title;
  final String? url;
  final String? urlImage;
  final String? date;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    var textStyle = TextStyle(
      fontSize: height * 0.02,
      fontStyle: FontStyle.italic,
    );
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
            height:
                height), // Utilisation du composant AppBarTitle pour afficher le titre de l'application
      ),
      body: Column(
        children: [
          Card(
            color: kBackgroundColor.withOpacity(0.2),
            child: Column(
              children: [
                Image.network(
                  urlImage!,
                  fit: BoxFit.cover,
                  height: height * 0.2,
                  width: width,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Author:   $author",
                        style: textStyle,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.open_in_new,
                          color: kTextColor, size: height * 0.04),
                      onPressed: () async {
                        await Share.share(url
                            .toString()); // Partager l'URL de l'article lorsqu'on appuie sur l'icône
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
              ),
              child: SingleChildScrollView(
                child: Text(
                  desc!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: kBackgroundColor.withOpacity(0.2),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      "Source: $sourceName",
                      style: textStyle,
                    ),
                  ),
                  Text(
                    "Date: ${date.toString().substring(0, 10)}",
                    style: textStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
