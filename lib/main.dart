import 'package:ffood/provider/theme_provider.dart';
import 'package:ffood/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ffood/helper/dependency.dart' as dep;

import 'Route/Routes.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(
      statusBarColor: AppColors.statusBarGrey,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white


    // Status bar
  );
  await dep.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) => ChangeNotifierProvider(create: (context) => ThemeProvider(),builder: (context, child){

      final provider = Provider.of<ThemeProvider>(context);

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // theme: ThemeData.dark(), // default dark theme replaces default light theme
        theme:  provider.theme,
        title: 'Flutter Demo',
        getPages: Routes.routes,
        initialRoute: Routes.welcomeScreen,
      );
    },),

      designSize:  const Size(375, 812),
    );
  }
}
