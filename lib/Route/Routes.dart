import 'package:ffood/controllers/OnBoardingController.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../viewbindings/HomeScreenBinding.dart';
import '../viewbindings/MainScreenBinding.dart';
import '../viewbindings/OnBoardingBinding.dart';
import '../viewbindings/WelcomeBinding.dart';
import '../views/HomeScreen.dart';
import '../views/MainScreen.dart';
import '../views/OnBoardingScreen.dart';
import '../views/WelcomeScreen.dart';


class Routes {

  static const String welcomeScreen = '/welcomeScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String homeScreen = '/homeScreen';
  static const String mainScreen = '/mainScreen';

  static final routes = [
    GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
  ];
}
