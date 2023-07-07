import 'package:flutter/material.dart';
import 'package:home_cloud/ui/screens/about_app_screen.dart';
import 'package:home_cloud/utils/navigator_util.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Home Cloud️',style: TextStyle(color: Colors.black87)),
            Text('Connected to [SAMSUNG T2] ☁',style: TextStyle(fontSize: 13,color: Colors.black54),)
          ],
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.lightBlue[100],
        actions: [
          popupMenuButton(context)
        ],
        leading: IconButton(
          onPressed: ()=> scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(Icons.menu,color: Colors.black54,),
        ),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: LottieBuilder.asset(
                  'assets/lottie_animations/main-cloud.json',
                  height: MediaQuery.of(context).size.height * 0.25,
                  repeat: true,
                ),
              ),
              const Text('Welcome to Home Cloud ☁️',style: TextStyle(fontSize: 20),)
            ],
          )
      ),
    );
  }

  /// The app bar actions to view a simple menu
  PopupMenuButton popupMenuButton(BuildContext context){
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'menu_item_1',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.settings,color: Colors.black54,),
              SizedBox(width: 5,),
              Text('Settings'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'menu_item_2',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.help_outline,color: Colors.black54,),
              SizedBox(width: 5),
              Text('Help'),
            ],
          ),
        ),
      ],
      onSelected: (String value) {
        // Handle menu item selection
        switch (value) {
          case 'menu_item_1':
            Navigator.of(context).push(
                NavigatorUtil.createRouteWithSlideAnimation(
                    newPage: const AboutAppScreen())
            );
            break;
          case 'menu_item_2':
            final url = Uri.parse('https://daumienebi.github.io/yo_nunca/policy.html');
            //_launchUrl(url);
            break;
        }
      },
    );
  }

}
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

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
      color: Colors.lightBlue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black87,
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 70,
            ),
          ),
          // display name
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text('admin',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget optionsListWidget(
      BuildContext context) {
    return ListView(
      // 0 to remove the random white space that was appearing
      padding: const EdgeInsets.only(top: 0),
      children: [
        //About the app
        ListTile(
          leading: const Icon(Icons.cloud),
          title: const Text('Cloud status'),
          onTap: () {
          },
        ),
        //Log out
        ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Log out'),
            onTap: () {
            }),
        //Delete user account
        ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Account'),
            onTap: () {
            })
      ],
    );
  }
  _launchUrl(Uri url) async{
    await launchUrl(url,mode:LaunchMode.externalApplication);
  }
}


