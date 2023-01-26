import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ffood/helper/dependency.dart' as dep;
import 'package:ffood/util/app_colors.dart';
import 'package:ffood/util/app_themes.dart';
import 'package:ffood/util/get_storage_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Route/Routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(
      statusBarColor: AppColors.statusBarGrey,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white

      // Status bar
      );
  await dep.init();
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    bool isDarkMode = getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
    getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);

    return ScreenUtilInit(
      builder: (context, child) => ThemeProvider(
        initTheme:
            isDarkMode ? AppThemes.darkThemeData : AppThemes.lightThemeData,
        builder: (_, myTheme) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            // theme: ThemeData.dark(), // default dark theme replaces default light theme

            title: 'FFood',
            getPages: Routes.routes,
            initialRoute: Routes.welcomeScreen,
          );
        },
      ),
      designSize: const Size(375, 812),
    );
  }
}
