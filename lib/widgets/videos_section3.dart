import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class VideoSection3 extends StatelessWidget {
// static data for videos
  List videoList = [
    'Allocation dynamique de la mémoire',
    'Les Enregistrement & Fichiers',
    'Les Listes Chainee',
    'Les Piles et File',
    'Les Arbes'
  ];
  final List<String> videoLinks = [
    'https://youtu.be/6mlp13UGfUM?list=PLZpzLuUp9qXxKSkKT43ppqzb8c2ahO4VS',
    'https://youtu.be/Cd0MT3AOBKI',
    'https://youtu.be/Ollj0ENqeNY',
    'https://youtu.be/Nz1aLsp5XBo',

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
          subtitle: Text("200 min 50 sec"),
        );
      },
    );
  }
   Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'URL $url';
    }
  }
}
