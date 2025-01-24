import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              color: Color(0xFF674AEF),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Bonjour ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Exercice avec correction ,',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/User.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            // color: Theme.of(context).primaryColor,
            color: Color(0xFF674AEF),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(context, 'Exercice1');
                    },
                    child: itemDashboard(
                      'Serie 1',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Correction1');
                    },
                    child: itemDashboard(
                      'Correction',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Exercice2');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Serie 2',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Correction2');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Correction',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Exercice3');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Serie 3',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Correction3');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Correction',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Exercice4');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Serie 4',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Correction4');
                      // Logique à exécuter lorsque "Correction" est cliqué
                    },
                    child: itemDashboard(
                      'Correction',
                      CupertinoIcons.doc_on_clipboard_fill,
                      Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  // color: Theme.of(context).primaryColor.withOpacity(.2),
                  color: Color(0xFF674AEF).withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );

  // creation d'une map
}
