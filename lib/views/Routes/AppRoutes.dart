import 'package:get/get.dart';

import '../screens/HomeScreen.dart';
import '../screens/SignInScreen.dart';

class AppRoutes {
  static const SIGNINSCREEN = '/';
  static const HOMESCREEN = '/home';

  static final routes = [
    GetPage(
      name: SIGNINSCREEN,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: HOMESCREEN,
      page: () => HomeScreen(),
    ),
  ];
}
