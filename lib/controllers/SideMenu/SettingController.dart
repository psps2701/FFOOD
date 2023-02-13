import 'package:ffood/controllers/MainScreen/MainScreenController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_themes.dart';
import 'package:get_storage/get_storage.dart';
import '../../util/get_storage_key.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import '../MainScreen/HomeScreenController.dart';


class SettingController extends GetxController with GetTickerProviderStateMixin {

    //TabController? tabController;
    TabController? themeTabController;
    TabController?    tabController ;
    late final GetStorage _getStorage;
    var isDarkMode = false.obs;


  @override
  Future<void> onInit() async {
   // tabController = TabController(length: 2, vsync: this);

    _getStorage = GetStorage();
    isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
    themeTabController = TabController(length: 2, vsync: this, initialIndex: isDarkMode.value ? 1 : 0);
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }


    void changeTheme(BuildContext context) {
      if (kDebugMode) {
        print("isDarkMode==>${ GetStorage().read(GetStorageKey.IS_DARK_MODE)}");
      }
      final theme =
      GetStorage().read(GetStorageKey.IS_DARK_MODE) ? AppThemes.lightThemeData : AppThemes.darkThemeData;

      ThemeSwitcher.of(context).changeTheme(theme: theme);


      var mainController = Get.find<MainScreenController>();
      var homeController = Get.find<HomeScreenController>();

      if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
        _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
        isDarkMode.value = false;
        mainController.isDarkMode.value = false;
      homeController.isDarkMode.value = false;
      homeController.isDarkMode.refresh();

      } else {
        _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
        mainController.isDarkMode.value = true;
        homeController.isDarkMode.value = true;
        homeController.isDarkMode.refresh();
        isDarkMode.value = true;
      }
    }
}
