import 'package:flutter/material.dart';
import 'package:home_cloud/view/components/app_drawer.dart';
import 'package:home_cloud/view/screens/about_app_screen.dart';
import 'package:home_cloud/utils/navigator_util.dart';
import 'package:lottie/lottie.dart';

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
          children: [
            const Text('Home Cloud️'),
            appBarTitle(true)
          ],
        ),
        toolbarHeight: 60,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey.shade900,
        actions: [
          popupMenuButton(context)
        ],
        leading: IconButton(
          onPressed: ()=> scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
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
              const Text('Welcome to Home Cloud ️',style: TextStyle(fontSize: 20),)
            ],
          )
      ),
    );
  }

  Widget appBarTitle(bool isConnected){
    return isConnected ? Row(
      children: const [
        Text('Connected to [SAMSUNG T2] ',style: TextStyle(fontSize: 13)),
        Icon(Icons.cloud_done_rounded,color: Colors.greenAccent,)
      ],
    ) : Row(
      children: const [
        //Text('Connected to [SAMSUNG T2] ',style: TextStyle(fontSize: 13)),
        Text('No connection ',style: TextStyle(fontSize: 13)),
        Icon(Icons.cloud_off,color: Colors.redAccent,)
      ],
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
            children: [
              Icon(Icons.settings,color: Colors.grey.shade700,),
              const SizedBox(width: 5,),
              const Text('Settings'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'menu_item_2',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.help_outline,color: Colors.grey.shade700,),
              const SizedBox(width: 5),
              const Text('Help'),
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