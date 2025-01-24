import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class VideoSection1 extends StatelessWidget {
// static data for videos
  List videoList = [
    'Introduction Langage C',
    'Strecture programme C',
    'Instructions conditionnelles',
    ' Instructions répétitives : Les boucles',
  ];

  final List<String> videoLinks = [
    'https://youtu.be/I4U0sQDw5Nw?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/aUcdqi5sfFQ?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/wVIkmvc5ACo?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/BRg1ZqM-FXQ?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
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
