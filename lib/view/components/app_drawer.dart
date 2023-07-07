import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return drawerContents(context);
  }

  /// The drawer that is returned for a user that is signed in
  Widget drawerContents(BuildContext context) {
    return Column(
      children: [
        userData(context),
        Expanded(
          child: optionsListWidget(context),
        ),
      ],
    );
  }

  Widget userData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black54,
            child: Icon(
              Icons.person,
              color: Colors.lightBlueAccent,
              size: 50,
            ),
          ),
          // display name
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text('admin',
                  style: TextStyle(
                    color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,))
          ),
        ],
      ),
    );
  }

  Widget optionsListWidget(
      BuildContext context) {
    final iconColor = Colors.grey.shade700;
    return ListView(
      // 0 to remove the random white space that was appearing
      padding: const EdgeInsets.only(top: 0),
      children: [
        //About the app
        ListTile(
          leading: Icon(Icons.cloud,color: iconColor),
          title: const Text('Cloud status'),
          onTap: () {
          },
        ),
        //Log out
        ListTile(
            leading: Icon(Icons.logout_rounded,color: iconColor),
            title: const Text('Log out'),
            onTap: () {
            }),
      ],
    );
  }

  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }
}


