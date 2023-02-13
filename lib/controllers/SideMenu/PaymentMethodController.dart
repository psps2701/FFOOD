import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_themes.dart';
import 'package:get_storage/get_storage.dart';
import '../../util/get_storage_key.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';


class PaymentMethodController extends GetxController with GetSingleTickerProviderStateMixin {

    //TabController? tabController;
    TabController? tabController;
    late final GetStorage _getStorage;
    var isDarkMode = false.obs;
    var index = 0.obs;

  @override
  Future<void> onInit() async {
   // tabController = TabController(length: 2, vsync: this);
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _getStorage = GetStorage();
    isDarkMode.value = _getStorage.read(GetStorageKey.IS_DARK_MODE);
    super.onInit();
  }


    void changeTheme(BuildContext context) {
      if (kDebugMode) {
        print("isDarkMode==>${ GetStorage().read(GetStorageKey.IS_DARK_MODE)}");
      }
      final theme =
      GetStorage().read(GetStorageKey.IS_DARK_MODE) ? AppThemes.lightThemeData : AppThemes.darkThemeData;
      ThemeSwitcher.of(context).changeTheme(theme: theme);
      if (_getStorage.read(GetStorageKey.IS_DARK_MODE)) {
        _getStorage.write(GetStorageKey.IS_DARK_MODE, false);
        isDarkMode.value = false;
      } else {
        _getStorage.write(GetStorageKey.IS_DARK_MODE, true);
        isDarkMode.value = true;
      }
    }
}
