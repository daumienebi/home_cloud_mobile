import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_cloud/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Make the status bar the same as the scaffold color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade900,
        systemNavigationBarDividerColor: Colors.transparent
    ));
    return  MaterialApp(
      title: 'Home Cloud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.varelaRoundTextTheme()
      ),
      routes: AppRoutes.allRoutes,
      initialRoute: AppRoutes.routeStrings.home,
      //supportedLocales: L10n.all,
      //localizationsDelegates: const [
      //  AppLocalizations.delegate,
      //  GlobalMaterialLocalizations.delegate,
      //  GlobalCupertinoLocalizations.delegate,
      //  GlobalWidgetsLocalizations.delegate
      // ],
    );
  }
}

/*
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: const MyApp(),
    );
  }
}
*/