import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class VideoSection2 extends StatelessWidget {
// static data for videos
  List videoList = [
    'Les instructions de contrôle des boucles ',
    'Les Tableaux en Langage C',
    'Définition et appel de fonction',
    'Les Pointeurs',
    'Chaînes de caractères en C',
  ];

  final List<String> videoLinks = [
    'https://youtu.be/zlYloMvKxdI?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS'
    'https://youtu.be/LYShTksTNpQ?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/NLUbfSQZwJ0?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/hqNqPc0tlfE?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/qXBjOVz8y-M?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            // _playVideo(context, videoUrls[index]);
            _launchURL(videoLinks[index]);
          },
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(videoList[index]),
          subtitle: Text("20 min 50 sec"),
        );
      },
    );
  }

  // Fonction pour lancer l'URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'URL $url';
    }
  }
}
