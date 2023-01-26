import 'package:ffood/viewbindings/RestaurantProfileScreenBinding.dart';
import 'package:ffood/viewbindings/SearchFoodScreenBinding.dart';
import 'package:ffood/viewbindings/SearchScreenBinding.dart';
import 'package:ffood/viewbindings/auth/LoginScreenBinding.dart';
import 'package:ffood/viewbindings/auth/OtpScreenBinding.dart';
import 'package:ffood/viewbindings/auth/RegisterScreenBinding.dart';
import 'package:ffood/viewbindings/auth/ResetPasswordScreenBinding.dart';
import 'package:ffood/views/RestaurantProfileScreen.dart';
import 'package:ffood/views/SearchFoodScreen.dart';
import 'package:ffood/views/SearchScreen.dart';
import 'package:ffood/views/auth/LoginScreen.dart';
import 'package:ffood/views/auth/OtpScreen.dart';
import 'package:ffood/views/auth/RegisterScreen.dart';
import 'package:ffood/views/auth/RegistrationScreen.dart';
import 'package:ffood/views/auth/ResetPasswordScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../viewbindings/HomeScreenBinding.dart';
import '../viewbindings/MainScreenBinding.dart';
import '../viewbindings/OnBoardingBinding.dart';
import '../viewbindings/WelcomeBinding.dart';
import '../viewbindings/auth/RegistrationScreenBinding.dart';
import '../views/HomeScreen.dart';
import '../views/MainScreen.dart';
import '../views/OnBoardingScreen.dart';
import '../views/WelcomeScreen.dart';


class Routes {

  static const String welcomeScreen = '/welcomeScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String homeScreen = '/homeScreen';
  static const String mainScreen = '/mainScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String otpScreen = '/otpScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String restaurantprofileScreen = '/restaurantprofileScreen';
  static const String searchFoodScreen = '/searchFoodScreen';
  static const String searchScreen = '/searchScreen';

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
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordScreenBinding(),
    ),
    GetPage(
      name: registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegistrationScreenBinding(),
    ),
    GetPage(
      name: restaurantprofileScreen,
      page: () => const RestaurantProfileScreen(),
      binding: RestaurantProfileScreenBinding(),
    ),
    GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
      binding: SearchScreenBinding(),
    ),GetPage(
      name: searchFoodScreen,
      page: () => const SearchFoodScreen(),
      binding: SearchFoodScreenBinding(),
    ),
  ];
}
