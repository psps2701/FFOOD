import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../viewbindings/OnboardingBinding.dart';
import '../views/OnboardingScreen.dart';


class Routes {

  static const String onBoardingScreen = '/onBoardingScreen';

  static final routes = [
    GetPage(
      name: onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
  ];
}
