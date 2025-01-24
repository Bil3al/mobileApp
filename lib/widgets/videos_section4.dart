import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class VideoSection4 extends StatelessWidget {
// static data for videos
  List videoList = [
    ' Creation des Processus  ',
    'Synchronisation des processus',
    'Creations des  Threads',
    'gestion des threads',
  ];
  final List<String> videoLinks = [
    'https://youtu.be/jWwPxd-h_6c',
    'https://youtu.be/Q5cqWeF9ldo',
    'https://youtu.be/9JAblZeSwOI',
    'https://youtu.be/-zA5PeYuWA4',
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

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'URL $url';
    }
  }
}
