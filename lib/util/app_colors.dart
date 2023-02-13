import 'dart:ui';
import 'package:get_storage/get_storage.dart';




import 'get_storage_key.dart';class AppColors {
  static const Color darkBlue = Color(0xff0f5eaf);

  static Color themeColor = fromHex('#FC8019');
  static Color white = fromHex('#FFFFFF');
  static Color statusBarGrey = fromHex('#f8f8f8');

  static Color lightDark =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#000000');
  static Color themeDark =   fromHex('#2D2D3A');
  static Color themeWhite =   fromHex('#FFFFFF');
  static Color outline =   fromHex('#2D2D3A');



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


  ///status colors
  static Color pendingColor  = fromHex('#716acb');
  static Color acceptColor  = fromHex('#52bfa3');
  static Color rejectColor  = fromHex('#ed506c');

  static Color textGrayColor  = fromHex('#515053');


}
