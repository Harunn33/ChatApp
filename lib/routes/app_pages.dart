// ignore_for_file: constant_identifier_names

import 'package:chat_app/modules/Signup/index.dart';
import 'package:chat_app/modules/Splash/index.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final List<GetPage<dynamic>> routes = <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const Signup(),
      binding: SignupBinding(),
    ),
  ];
}
