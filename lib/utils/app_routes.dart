import 'package:home_cloud/view/screens/home_screen.dart';

/// Class to handle the navigation in case the Navigator..pushNamed(..) method
/// is used
class AppRoutes{
  static RouteStrings routeStrings = RouteStrings();
  static final allRoutes = {
    routeStrings.home : (_) => const HomeScreen(),
    //routeStrings.signInPage: (_) => const SignInPage(),
    //routeStrings.signUpPage: (_) => const SignUpPage(),
  };
}

/// Class to map all the pages in the app,they can be used in the
/// pushedNamed method of the [Navigator]
class RouteStrings {
  String get home => 'home';
  String get signInScreen => 'signInScreen';
  String get signUpScreen => 'signUpScreen';
}