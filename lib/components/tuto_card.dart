import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importation du package provider pour la gestion de l'état
import 'package:share_plus/share_plus.dart'; // Importation du package share_plus pour le partage
import 'package:web_news/const.dart'; // Importation des constantes
import 'package:web_news/services/datas.dart'; // Importation de la classe Datas pour récupérer les données
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Importation du package Youtube Player Flutter

class TutoCard extends StatefulWidget {
  const TutoCard({super.key, required this.videoId, required this.index});
  final int index; // Index de la vidéo
  final String videoId; // ID de la vidéo

  @override
  State<TutoCard> createState() => _TutoCardState();
}

class _TutoCardState extends State<TutoCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Consumer<Datas>(builder: (context, datas, child) {
      final isNotEmpty = datas.tutorials
          .isNotEmpty; // Vérifie si la liste des tutoriels n'est pas vide

      final tutorials =
          datas.tutorials; // Liste des tutoriels provenant de l'API Youtube
      final tutorialsViews =
          datas.tutorialsViews; // Liste de tutoriels prédéfinis

      // Récupération du titre, de la date et du nom de la chaîne en fonction de si la liste des tutoriels est vide ou non
      final title = isNotEmpty
          ? tutorials[widget.index].title
          : tutorialsViews[widget.index].title;
      final date = isNotEmpty
          ? tutorials[widget.index].publishedAt
          : tutorialsViews[widget.index].publishedAt;
      final channelName = isNotEmpty
          ? tutorials[widget.index].channelName
          : tutorialsViews[widget.index].channelName;

      // Construction de la carte avec le lecteur Youtube et les informations sur la vidéo
      return GestureDetector(
        onLongPress: () async {
          Share.share(" https://www.youtube.com/watch?v=${widget.videoId}");
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lecteur Youtube
                SizedBox(
                  width: width * 0.8,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: kAppBarColor,
                  ),
                ),
                SizedBox(
                  width: width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Titre de la vidéo
                      Flexible(
                        child: Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      // Date de publication
                      Flexible(
                          child: Text("Published on: $date",
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ))),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      // Nom de la chaîne
                      Flexible(
                          child: Text("Published by: $channelName",
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
